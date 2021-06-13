/*------------------------------------------------------------------------------
-- Fairchild Channel F console
--------------------------------------------------------------------------------
-- DO 8/2020
--------------------------------------------------------------------------------
   With help from MAME F8 model

   0000  : ROM : sl90025.rom or sl31253.rom
   0400  : ROM : sl31254.rom
   0800+ : CART

   COLOR = P[126 + Y*128][2] & P[125 + Y*128][2] & P[X + Y*128][1:0]

   F3850 :   PORT 0 : 7 : NC
                      6 :                       OUT : ENABLE IN BTN
                      5 :                       OUT : ARM WRT
                      4 : NC
                      3 : IN  : "START"
                      2 : IN  : "HOLD"
                      1 : IN  : "MODE"
                      0 : IN  : "TIME"
             PORT 1 : 7 : IN  : "RIGHT G.DOWN"  OUT : WRITE DATA1
                      6 : IN  : "RIGHT G.UP     OUT : WRITE DATA0
                      5 : IN  : "RIGHT CW"      OUT :
                      4 : IN  : "RIGHT CCW"     OUT :
                      3 : IN  : "RIGHT UP"      OUT :
                      2 : IN  : "RIGHT DOWN"    OUT :
                      1 : IN  : "RIGHT LEFT"    OUT :
                      0 : IN  : "RIGHT RIGHT"   OUT :

   F3851 :   PORT 4 : 7 : IN  : "LEFT  G.DOWN"  OUT :
   SL31253            6 : IN  : "LEFT  G.UP"    OUT : HORIZ BUS 6
                      5 : IN  : "LEFT  CW"      OUT : HORIZ BUS 5
                      4 : IN  : "LEFT  CCW"     OUT : HORIZ BUS 4
                      3 : IN  : "LEFT  UP"      OUT : HORIZ BUS 3
                      2 : IN  : "LEFT  DOWN"    OUT : HORIZ BUS 2
                      1 : IN  : "LEFT  LEFT"    OUT : HORIZ BUS 1
                      0 : IN  : "LEFT  RIGHT"   OUT : HORIZ BUS 0
             PORT 5 : 7 : IN  :                 OUT : TONE BN
                      6 : IN  :                 OUT : TONE AN
                      5 : IN  :                 OUT : VERT  BUS 5
                      4 : IN  :                 OUT : VERT  BUS 4
                      3 : IN  :                 OUT : VERT  BUS 3
                      2 : IN  :                 OUT : VERT  BUS 2
                      1 : IN  :                 OUT : VERT  BUS 1
                      0 : IN  :                 OUT : VERT  BUS 0

   F3851 : No IO
   SL31254
*/

package chf

import spinal.core._
import scala.language.postfixOps

class chf_core extends Component {
  val io = new Bundle {
    val pll_locked = in Bool
    val pal = in Bool
    val reset = in Bool
    // VGA
//    val vga_clk = out Bool
    val vga_ce = out Bool
    val vga_r = out(UInt(8 bits))
    val vga_g = out UInt (8 bits)
    val vga_b = out UInt (8 bits)
    val vga_hs = out Bool
    val vga_vs = out Bool
    val vga_de = out Bool
    // HPS IO
    val joystick_0 = in UInt (32 bits)
    val joystick_1 = in UInt (32 bits)
    val joystick_analog_0 = in UInt (16 bits)
    val joystick_analog_1 = in UInt (16 bits)
    val status = in UInt (32 bits)
    val ioctl_download = in Bool
    val ioctl_index = in Bits (8 bits)
    val ioctl_wr = in Bool
    val ioctl_addr = in Bits (25 bits)
    val ioctl_dout = in Bits (8 bits)
    val ioctl_wait = out Bool
    // AUDIO
    val audio_l = out UInt (16 bits)
    val audio_r = out UInt (16 bits)
  }

  //--------------------------------------------------------
  val dr = UInt(8 bits)
  val romc = UInt(5 bits)
  val phase = UInt(4 bits)
  val ce = Bool

  val pi0, po0, pi1, po1, pi1i, pi4, po4, pi4i, pi5, po5 = UInt(8 bits)
  val load_a = Reg(UInt(10 bits))
  val load_d = Reg(UInt(8 bits))
  val load_wr0, load_wr1, load_wr2, load_wr3 = Reg(Bool)
  val tick = Bool
  val reset_na, areset_na = Bool
  val vreset_na = Reg(UInt(16 bits)) //unsigned(0 TO 15);

  //--------------------------------------------------------
  //val INIT_ZERO = new Array[Byte](1024)
  val INIT_ZERO = Array.fill[Int](1024)(0)

  val HDISP = 208
  val HSYNCSTART = 212
  val HSYNCEND = 220
  val HTOTAL = 228

  val VDISP = 232
  val VSYNCSTART = 242
  val VSYNCEND = 246
  val VTOTAL = 262

  val dc0, pc0, pc1 = UInt(16 bits)
  val acc = UInt(8 bits)
  val visar = UInt(6 bits)
  val iozcs = UInt(5 bits)

  //--------------------------------------------------------
  // CPU

  import f8._
  import chf._

  ce := True
  io.vga_ce := ce

  val i_cpu = new f8_cpu
  i_cpu.io.dr := dr
  //dv_cpu := i_cpu.io.dv
  romc := i_cpu.io.romc
  phase := i_cpu.io.phase
  po0 := i_cpu.io.po_a
  po1 := i_cpu.io.po_b
  i_cpu.io.pi_a := pi0
  i_cpu.io.pi_b := pi1
  acc := i_cpu.io.acco
  i_cpu.io.ce := ce
  i_cpu.io.reset_na := reset_na
  visar := i_cpu.io.visaro
  iozcs := i_cpu.io.iozcso

  // PSU SL31253
  val i_psu0 = new f8_psu(PAGE = 0, IOPAGE = 1, IVEC = 0xFFFF, ROM = rompack.INIT_SL31253)
  i_psu0.io.dw := dr
  i_psu0.io.romc := romc
  i_psu0.io.tick := tick
  i_psu0.io.phase := phase
  i_psu0.io.ext_int := False
  //i_psu0.io.int_req
  po4 := i_psu0.io.po_a
  po5 := i_psu0.io.po_b
  i_psu0.io.pi_a := pi4
  i_psu0.io.pi_b := pi5
  i_psu0.io.pri_i := True
  //i_psu0.io.pri_o
  i_psu0.io.load_a := load_a
  i_psu0.io.load_d := load_d
  i_psu0.io.load_wr := False
  i_psu0.io.ce := ce
  i_psu0.io.reset_na := reset_na
  pc0 := i_psu0.io.pc0o
  pc1 := i_psu0.io.pc1o
  dc0 := i_psu0.io.dc0o

  // PSU SL31254
  val i_psu1 = new f8_psu(PAGE = 1, IOPAGE = 63, IVEC = 0xFFFF, ROM = rompack.INIT_SL31254)
  i_psu1.io.dw := dr
  i_psu1.io.romc := romc
  i_psu1.io.tick := tick
  i_psu1.io.phase := phase
  i_psu1.io.ext_int := False
  //i_psu1.io.int_req
  //i_psu1.io.po_a
  //i_psu1.io.po_b
  i_psu1.io.pi_a := U"hFF"
  i_psu1.io.pi_b := U"hFF"
  i_psu1.io.pri_i := True
  //i_psu1.io.pri_o
  i_psu1.io.load_a := load_a
  i_psu1.io.load_d := load_d
  i_psu1.io.load_wr := False
  i_psu1.io.ce := ce
  i_psu1.io.reset_na := reset_na

  // CARTRIDGE
  val i_psu2 = new f8_psu(PAGE = 2, IOPAGE = 62, IVEC = 0xFFFF, ROM = INIT_ZERO)
  i_psu2.io.dw := dr
  i_psu2.io.romc := romc
  i_psu2.io.tick := tick
  i_psu2.io.phase := phase
  i_psu2.io.ext_int := False
  //i_psu2.io.int_req
  //i_psu2.io.po_a
  //i_psu2.io.po_b
  i_psu2.io.pi_a := U"hFF"
  i_psu2.io.pi_b := U"hFF"
  i_psu2.io.pri_i := True
  //i_psu2.io.pri_o
  i_psu2.io.load_a := load_a
  i_psu2.io.load_d := load_d
  i_psu2.io.load_wr := load_wr0
  i_psu2.io.ce := ce
  i_psu2.io.reset_na := reset_na

  // CARTRIDGE
  val i_psu3 = new f8_psu(PAGE = 3, IOPAGE = 61, IVEC = 0xFFFF, ROM = INIT_ZERO)
  i_psu3.io.dw := dr
  i_psu3.io.romc := romc
  i_psu3.io.tick := tick
  i_psu3.io.phase := phase
  i_psu3.io.ext_int := False
  //i_psu3.io.int_req
  //i_psu3.io.po_a
  //i_psu3.io.po_b
  i_psu3.io.pi_a := U"hFF"
  i_psu3.io.pi_b := U"hFF"
  i_psu3.io.pri_i := True
  //i_psu3.io.pri_o
  i_psu3.io.load_a := load_a
  i_psu3.io.load_d := load_d
  i_psu3.io.load_wr := load_wr1
  i_psu3.io.ce := ce
  i_psu3.io.reset_na := reset_na

  // CARTRIDGE
  val i_psu4 = new f8_psu(PAGE = 4, IOPAGE = 60, IVEC = 0xFFFF, ROM = INIT_ZERO)
  i_psu4.io.dw := dr
  i_psu4.io.romc := romc
  i_psu4.io.tick := tick
  i_psu4.io.phase := phase
  i_psu4.io.ext_int := False
  //i_psu4.io.int_req
  //i_psu4.io.po_a
  //i_psu4.io.po_b
  i_psu4.io.pi_a := U"hFF"
  i_psu4.io.pi_b := U"hFF"
  i_psu4.io.pri_i := True
  //i_psu4.io.pri_o
  i_psu4.io.load_a := load_a
  i_psu4.io.load_d := load_d
  i_psu4.io.load_wr := load_wr2
  i_psu4.io.ce := ce
  i_psu4.io.reset_na := reset_na

  // CARTRIDGE
  val i_psu5 = new f8_psu(PAGE = 5, IOPAGE = 59, IVEC = 0xFFFF, ROM = INIT_ZERO)
  i_psu5.io.dw := dr
  i_psu5.io.romc := romc
  i_psu5.io.tick := tick
  i_psu5.io.phase := phase
  i_psu5.io.ext_int := False
  //i_psu5.io.int_req
  //i_psu5.io.po_a
  //i_psu5.io.po_b
  i_psu5.io.pi_a := U"hFF"
  i_psu5.io.pi_b := U"hFF"
  i_psu5.io.pri_i := True
  //i_psu5.io.pri_o
  i_psu5.io.load_a := load_a
  i_psu5.io.load_d := load_d
  i_psu5.io.load_wr := load_wr3
  i_psu5.io.ce := ce
  i_psu5.io.reset_na := reset_na

  when(i_psu0.io.dv) {
    dr :=  i_psu0.io.dr
  } .elsewhen(i_psu1.io.dv) {
    dr :=  i_psu1.io.dr
  } .elsewhen(i_psu2.io.dv) {
    dr := i_psu2.io.dr
  } .elsewhen(i_psu3.io.dv) {
    dr := i_psu3.io.dr
  } .elsewhen(i_psu4.io.dv) {
    dr := i_psu4.io.dr
  } .elsewhen(i_psu5.io.dv) {
    dr := i_psu5.io.dr
  }  .otherwise {
    dr := i_cpu.io.dw
  }

  //--------------------------------------------------------
  // CARTRIDGE LOAD
  load_a := io.ioctl_addr(9 downto 0).asUInt
  load_wr0 := ~io.ioctl_addr(10) & ~io.ioctl_addr(11) & io.ioctl_wr
  load_wr1 :=  io.ioctl_addr(10) & ~io.ioctl_addr(11) & io.ioctl_wr
  load_wr2 := ~io.ioctl_addr(10) &  io.ioctl_addr(11) & io.ioctl_wr
  load_wr3 :=  io.ioctl_addr(10) &  io.ioctl_addr(11) & io.ioctl_wr
  load_d := io.ioctl_dout.asUInt

  io.ioctl_wait := False

  //--------------------------------------------------------
  // VIDEO
  val vram_h = ~po4(6 downto 0)
  val vram_v = ~po5(5 downto 0)
  val vram_dw = ~po1(7 downto 6)
  val vram_wr = po0(5)

  val vram_a = UInt(13 bits)
  vram_a := (vram_h + vram_v * 128).resized

  val pos = Reg(UInt(13 bits))
  val p125, p126 = Bool
  val pix = UInt(2 bits)

  val v125, v126 = Mem(Bool, 64)
  val vram = Mem(UInt(2 bits), 128 * 64) // PIXELS

  val hpos, hposp = Reg(UInt(8 bits))
  val vpos, vposp = Reg(UInt(9 bits))

  val vga_r, vga_g, vga_b = Reg(UInt(8 bits))
  val vga_hs, vga_vs, vga_de = Reg(Bool)
  vram.write(vram_a, vram_dw, vram_wr)
  v125.write(vram_v, vram_dw(1), vram_wr && (vram_h === 125))
  v126.write(vram_v, vram_dw(1), vram_wr && (vram_h === 126))

  pix := vram.readSync(pos,ce)
  p125 := v125.readSync(vposp(7 downto 2),ce)
  p126 := v126.readSync(vposp(7 downto 2),ce)

  // VIDEO SWEEP
  when(ce) {
    hpos := hpos + 1
    when(hpos === HTOTAL - 1) {
      hpos := 0
      vpos := vpos + 1
      when(vpos === VTOTAL - 1) {
        vpos := 0
      }
    }

    //pos := ((vpos / 4) % 64) * 128 + ((hpos / 2) % 128)
    pos := (vpos(7 downto 2) @@ U"7'b0") + hpos(7 downto 1)
    vposp := vpos
    hposp := hpos

    // BLACK WHITE RED GREEN BLUE LTGRAY LTGREEN LTBLUE
    val PAL_R = Mem(UInt(8 bits),8) init
      Array(U"h10", U"hFD", U"hFF", U"h02", U"h4B", U"hE0", U"h91", U"hCE")
    val PAL_G = Mem(UInt(8 bits),8) init
      Array(U"h10", U"hFD", U"h31", U"hCC", U"h3F", U"hE0", U"hFF", U"hD0")
    val PAL_B = Mem(UInt(8 bits),8) init
      Array(U"h10", U"hFD", U"h53", U"h5D", U"hF3", U"hE0", U"hA6", U"hFF")

    val CMAP = Mem(UInt(3 bits),16) init
      Array(U"h0", U"h1", U"h1", U"h1", U"h7", U"h4", U"h2", U"h3",
            U"h5", U"h4", U"h2", U"h3", U"h6", U"h4", U"h2", U"h3")

    def col : UInt = p125.asUInt @@ p126 @@ pix
    vga_r := PAL_R.readAsync((CMAP.readAsync(col)))
    vga_g := PAL_G.readAsync((CMAP.readAsync(col)))
    vga_b := PAL_B.readAsync((CMAP.readAsync(col)))
    vga_de := (vposp <= VDISP && hposp < HDISP)
    vga_hs := (hposp >= HSYNCSTART && hposp <= HSYNCEND)
    vga_vs := (vposp >= VSYNCSTART && vposp <= VSYNCEND)
  }

  //io.vga_clk:=clk;
  io.vga_r := vga_r
  io.vga_g := vga_g
  io.vga_b := vga_b
  io.vga_hs := vga_hs
  io.vga_vs := vga_vs
  io.vga_de := vga_de

  // 128 x 64 pixels => 102 x 58 visible => 95 x 58 visible
  // CPU : F video / 2
  //   1.7897725MHz (NTSC)
  //   2.0000000MHz (PAL GEN 1)
  //   1.7734475MHz (PAL GEN 2)

  //--------------------------------------------------------
  // Joysticks / Button
  pi0(7 downto 4) := po0(7 downto 4)
  pi0(0) := ~(io.joystick_0(4) | io.joystick_1(4)) // TIME
  pi0(1) := ~(io.joystick_0(5) | io.joystick_1(5)) // MODE
  pi0(2) := ~(io.joystick_0(6) | io.joystick_1(6)) // HOLD
  pi0(3) := ~(io.joystick_0(7) | io.joystick_1(7)) // START

  pi1i(7) := ~io.joystick_0(8) // RIGHT G.DOWN
  pi1i(6) := ~io.joystick_0(9) // RIGHT G.UP
  pi1i(5) := ~io.joystick_0(10) // RIGHT CW
  pi1i(4) := ~io.joystick_0(11) // RIGHT CCW
  pi1i(3) := ~io.joystick_0(3) // RIGHT UP
  pi1i(2) := ~io.joystick_0(2) // RIGHT DOWN
  pi1i(1) := ~io.joystick_0(1) // RIGHT LEFT
  pi1i(0) := ~io.joystick_0(0) // RIGHT RIGHT

  pi4i(7) := ~io.joystick_1(8) // LEFT G.DOWN
  pi4i(6) := ~io.joystick_1(9) // LEFT G.UP
  pi4i(5) := ~io.joystick_1(10) // LEFT CW
  pi4i(4) := ~io.joystick_1(11) // LEFT CCW
  pi4i(3) := ~io.joystick_1(3) // LEFT UP
  pi4i(2) := ~io.joystick_1(2) // LEFT DOWN
  pi4i(1) := ~io.joystick_1(1) // LEFT LEFT
  pi4i(0) := ~io.joystick_1(0) // LEFT RIGHT

  val rdena = ~po0(6)

  pi1 := (rdena) ? (pi1i | po1) | po1
  pi4 := (rdena) ? (pi4i | po4) | po4
  pi5 := po5

  //--------------------------------------------------------
  // Audio
  // 00 : Silence
  // 01 : 1kHz
  // 10 : 500Hz
  // 11 : 120Hz

  val audio_l = Reg(UInt(16 bits))
  val audio_r = Reg(UInt(16 bits))
  val vdiv = Reg(UInt(16 bits))
  val s_v = Bool
  io.audio_l := audio_l
  io.audio_r := audio_r

  val tone = po5(7 downto 6)

  vdiv := vdiv + 1
  s_v := tone.mux(
    0 -> False,
      1 -> vdiv(10),
      2 -> vdiv(9),
      3 -> vdiv(7)
    )
  audio_l := (default -> s_v)
  audio_r := (default -> s_v)

  //-------------<-------------------------------------------
  areset_na := !io.reset & io.pll_locked & !io.ioctl_download

  when(!areset_na) {
    vreset_na := 0
  } otherwise {
    vreset_na := vreset_na(14 downto 0) @@ U"1"
  }

  reset_na := vreset_na(15)
}

object MySpinalConfig extends SpinalConfig(
  defaultConfigForClockDomains = ClockDomainConfig(resetKind = SYNC))

//Verilog
object MyTopLevelVerilog {
  def main(args: Array[String]) {
    MySpinalConfig.generateVerilog(new chf_core)
  }
}

//VHDL
object MyTopLevelVhdl {
  def main(args: Array[String]) {
    MySpinalConfig.generateVhdl(new chf_core)
  }
}
