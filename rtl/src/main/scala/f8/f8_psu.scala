/*------------------------------------------------------------------------------
-- Fairchild F8 F351 PSU
--------------------------------------------------------------------------------
-- DO 8/2020
--------------------------------------------------------------------------------
-- With help from MAME F8 model

-- - 1kB ROM
-- - 2 8bits IO port
-- - Programmable timer
-- - Interrupts

--  MASK OPTIONS
--  - 1k ROM
--  - 6bits page select
--  - 6bits IO port address select
--  - 16bits interrupt address vector
--  - IO port output option
*/

package f8
import spinal.core._
import scala.language.postfixOps

class f8_psu(PAGE : Int,IOPAGE : Int, IVEC  : Int , ROM : Array[Int]) extends Component {
  val io = new Bundle {
    val dw = in(UInt(8 bits)) // Data Write
    val dr = out(UInt(8 bits)) // Data Read
    val dv = out(Bool)

    val romc = in(UInt(5 bits))
    val tick = in(Bool) // 1/8 or 1/12 cycle length
    val phase = in(UInt(4 bits))

    val ext_int  = in(Bool)
    val int_req  = out(Bool)

    val pri_o    = out(Bool)
    val pri_i    = in(Bool)

    val po_a     = out(UInt(8 bits)) // IO port A
    val pi_a     = in(UInt(8 bits))

    val po_b     = out(UInt(8 bits)) // IO port B
    val pi_b     = in(UInt(8 bits))

    val load_a   = in(UInt(10 bits))
    val load_d   = in(UInt(8 bits))
    val load_wr  = in(Bool)

    val ce       = in(Bool)
    val reset_na = in(Bool)

    val pc0o     = out(UInt(16 bits))
    val pc1o     = out(UInt(16 bits))
    val dc0o     = out(UInt(16 bits))
  }

  val dc0,dc1 = Reg(UInt(16 bits))
  val pc0,pc1 = Reg(UInt(16 bits))
  
  val mem_a = UInt(16 bits)
  val mem_dr,mem_dw = UInt(8 bits)

  val io_rd,io_wr = Reg(Bool)
  val io_port,io_dw = Reg(UInt(8 bits))
  val io_dr = Reg(UInt(8 bits))
  
  val dr = Reg(UInt(8 bits))
  val dv = Reg(Bool)
  val inta_clr,inta_set,int_req_l = Reg(Bool)

  io.dr := dr
  io.dv := dv

  mem_a := (io.romc === U"00010" || io.romc === U"00101") ? dc0 | pc0

  //----------------------------------------------------------

  def pchk(A : UInt) : Bool = { ( A (15 downto 10) === PAGE) }
  when (io.ce) {
    inta_clr :=False
    when (io.phase===2) {
      dv :=False
    }
    io_wr :=False
    switch (io.romc) {
      is(U"00000") {
        /* S,L : Instruction fetch. The device whose address space includes
            the content of the PC0 register must place on the data bus
            the op code addressed by PC0. Then all devices increment
            the contents of PC0. */
        when (io.phase===2) {
          dr := mem_dr
          dv := pchk(pc0)
        }
        when (io.phase===6) {
          pc0:= pc0 + 1
        }
      }
      is (U"00001") {
        /* L   : The device whose address space includes the contents of
            the PC0 register must place on the data bus the contents of
            the memory location addressed by PC0. Then all devices add the
            8-bit value on the data bus, as a signed binary number, to PC0.*/
        when (io.phase===2) {
          dr := mem_dr
          dv := pchk(pc0)
        }
        when (io.phase===6) {
          pc0 := pc0 + io.dw.asSInt.resize(16).asUInt
        }
      }
      is (U"00010") {
        /* L   : The device whose DC0 addresses a memory word within the
            address space of that device must place on the data bus the
            contents of the memory location addressed by
            DC0. Then all devices increment DC0. */
        when (io.phase===2) {
          dr := mem_dr
          dv := pchk(dc0)
        }
        when (io.phase===6) {
          dc0:= dc0 + 1
        }
      }
      is (U"00011") {
        /* L,S : Similar to 00, except that it is used for Immediate Operand
            fetches (using PC0) instead of instruction fetches.*/
        when (io.phase===2) {
          dr := mem_dr
          dv := pchk(pc0)
        }
        when (io.phase===6) {
          pc0:= pc0 + 1
          io_port:=io.dw
        }
      }
      is (U"00100") {
        /* S   : Copy the contents of PC1 into PC0.*/
        when (io.phase===6) {
          pc0:= pc1
        }
      }
      is (U"00101") {
        /* L   : Store the data bus contents into the memory
            location pointed to by DC0. Increment DC0.
            <ROM ! NO WRITE>
          mem_a:=dc0;
          when (io.phase===4 && pchk(dc0)) {
            mem_wr:='1'
          }
          when (io.phase===6) {
            dc0:=dc0 + 1;
          }*/
      }
      is (U"00110") {
        /* L   : Place the high order byte of DC0 on the data bus.*/
        when (io.phase===2) {
          dr :=dc0(15 downto 8)
          dv :=True
        }
      }
      is (U"00111") {
        /* L   : Place the high order byte of PC1 on the data bus.*/
        when (io.phase===2) {
          dr :=pc1(15 downto 8)
          dv :=True
        }
      }
      is (U"01000") {
        /* L   : All devices copy the contents of PC0 into PC1. The CPU
            outputs zero on the data bus in this io.romc state. Load the
            data bus into both halves of PC0 thus clearing the register.*/
        when (io.phase===6) {
          pc1:=pc0
          pc0:=U"16'h0000"
        }
      }
      is (U"01001") {
        /* The device whose address space includes the contents of the DC0
            register must place the low order byte of DC0 onto the data bus.*/
        when (io.phase===2) {
          dr :=dc0(7 downto 0)
          dv :=pchk(dc0)
        }
      }
      is (U"01010") {
        /* L   : All devices add the 8-bit value on the data bus, treated
            as a signed binary number, to the Data Counter. */
        when (io.phase===6) {
          dc0 := dc0 + io.dw.asSInt.resize(16).asUInt
        }
      }
      is (U"01011") {
        /* L   : The device whose address space includes the value in PC1
            must place the low order byte of PC1 on the data bus.*/
        when (io.phase===2) {
          dr :=pc1(7 downto 0)
          dv :=pchk(pc1)
        }
      }
      is (U"01100") {
        /* L   : The device whose address space includes the contents of
            the PC0 register must place the contents of the memory word
            addressed by PC0 onto the data bus. Then all devices move the
            value which has just been placed on the data bus into the low
            order byte of PC0. */
        when (io.phase===2) {
          dr := mem_dr
          dv := pchk(pc0)
        }
        when (io.phase===6) {
          pc0(7 downto 0):= io.dw
        }
      }
      is (U"01101") {
        /* S   : All devices store in PC1 the current contents of PC0,
            incremented by 1. PC0 is unaltered.*/
        pc1 := pc0 +1
      }
      is (U"01110") {
        /* L   : The device whose address space includes the contents of
            PC0 must place the contents of the word addressed by PC0
            onto the data bus. The value on the data bus is then
            moved to the low order byte of DC0 by all devices*/
        when (io.phase===2) {
          dr := mem_dr
          dv := pchk(pc0)
        }
        when (io.phase===6) {
          dc0(7 downto 0):= io.dw
        }
      }
      is (U"01111") {
        /* L   : The interrupting device with highest priority must place
            the low order byte of the interrupt vector on the data bus.
            All devices must copy the contents of PC0 into PC1.
            All devices must move the contents of the data bus into
            the low order byte of PC0.*/
        when (io.phase===2) {
          dr :=U(IVEC,16 bits)(7 downto 0)
          dv :=int_req_l
        }
        when (io.phase===6) {
          pc1 := pc0
          pc0(7 downto 0) := io.dw
        }
      }
      is (U"10000") {
        /* L   : Inhibit any modification to the interrupt priority logic.
            <TODO>*/
      }
      is (U"10001") {
        /* L   : The device whose memory space includes the contents of
            PC0 must place the contents of the addressed memory word
            on the data bus. All devices must then move the contents
            of the data bus to the upper byte of DC0.*/
        when (io.phase===2) {
          dr :=mem_dr
          dv :=pchk(pc0)
        }
        when (io.phase===6) {
          dc0(15 downto 8):=io.dw
        }
      }
      is (U"10010") {
        /* L   : All devices copy the contents of PC0 into PC1. All
            devices then move the contents of the data bus into
            the low order byte of PC0.*/
        when (io.phase===6) {
          pc1:=pc0
          pc0(7 downto 0):=io.dw
        }
      }
      is (U"10011") {
        /* L   : The interrupting device with highest priority must move
            the high order half of the interrupt vector onto the data bus.
            All devices must move the contents of the data bus into the
            high order byte of PC0. The interrupting device will request
            its interrupt circuitry (so that it is no longer requesting CPU
            servicing and can respond to another interrupt).*/
        when (io.phase===2) {
          dr :=U(IVEC,16 bits)(15 downto 8)
          dv :=int_req_l
        }
        when (io.phase===6) {
          pc0(15 downto 8) := io.dw
          inta_clr:=int_req_l
        }
      }
      is (U"10100") {
        /* L   : All devices move the contents of the data bus into the
            high order byte of PC0.*/
        when (io.phase===6) {
          pc0(15 downto 8):=io.dw
        }
      }
      is (U"10101") {
        /* L   : All devices move contents of the data bus into the
            high order byte of PC1.*/
        when (io.phase===6) {
          pc1(15 downto 8):=io.dw
        }
      }
      is (U"10110") {
        /* L   : All devices move the contents of the data bus into the
            high order byte of DC0.*/
        when (io.phase===6) {
          dc0(15 downto 8):=io.dw
        }
      }
      is (U"10111") {
        /* L   : All devices move the contents of the data bus into the
            low order byte of PC0.*/
        when (io.phase===6) {
          pc0(7 downto 0):=io.dw
        }
      }
      is (U"11000") {
        /* L   : All devices move contents of the data bus into the low
            order byte of PC1.*/
        when (io.phase===6) {
          pc1(7 downto 0):=io.dw
        }
      }
      is (U"11001") {
        /* L   : All devices move contents of the data bus into the low
            order byte of DC0.*/
        when (io.phase===6) {
          dc0(7 downto 0):=io.dw
        }
      }
      is (U"11010") {
        /* L   : During the prior cycle an I/O port timer or interrupt
            control register was addressed, The device containing
            the addressed port must move the current contents of
            the data bus into the addressed port.*/
        when (io.phase===6) {
          io_dw:=io.dw
          io_wr:=(io_port(7 downto 2)===IOPAGE)
        }
      }
      is (U"11011") {
        /* L   : During the prior cycle the data bus specified the
            address of an I/O port. The device containing the
            addressed I/O port must place the contents of the I/O
            port on the data bus. (Note that the contents of timer
            and interrupt control retgisters cannot be read back onto
            the data bus.)*/
        when (io.phase===2) {
          io_rd:=(io_port(7 downto 2)===IOPAGE)
          dr:=io_dr
          dv:=(io_port(7 downto 2)===IOPAGE)
        }
      }
      is (U"11100") {
        /* L/S : None. Before IO port access*/
        when (io.phase===6) {
          io_port:=io.dw
        }
      }
      is (U"11101") {
        /* S   : Devices with DC0 and DC1 registers must switch registers.
            Devices without a DC1 register perform no operation.
          when (io.phase===6) {
            dc0:=dc1
            dc1:=dc0
          }*/
      }
      is (U"11110") {
        /* L   : The device whose address space includes the contents of
            PC0 must place the low order byte of PC0 onto the data bus.*/
        when (io.phase===2) {
          dr :=pc0(7 downto 0)
          dv :=pchk(pc0)
        }
      }
      is (U"11111") {
        /* L   : The device whose address space includes the contents of
            PC0 must place the high order byte of PC0 on the data bus.*/
        when (io.phase===2) {
          dr :=pc0(15 downto 8)
          dv :=pchk(pc0)
        }
      }
      default {
        // NULL
      }
    }

    when (!io.reset_na) {
      pc0:=0x0000
      pc1:=0x0000
      dc0:=0x0000
    }
  
  }

  //----------------------------------------------------------
  // ROM READ
  val mem = Mem(UInt(8 bits),1024)

  val ROMM = new Array[UInt](1024)
  for (i <-0 until 1024) { ROMM(i) = U(ROM(i),8 bits)}

  mem.init(ROMM)
  mem_dr:=mem.readSync(mem_a(9 downto 0),io.ce)
  mem.write(io.load_a,io.load_d,io.load_wr)
  
  //----------------------------------------------------------
  // IO PORTS

  val icr = Reg(UInt(2 bits))
  val tim = Reg(UInt(8 bits))
  val tdiv = Reg(UInt(5 bits))
  val po_a_l,po_b_l = Reg(UInt(8 bits))
  val inta = Reg(Bool)
  val pri_o = Reg(Bool)
  val ext_int_d,tim_int_d,tim_int = Reg(Bool)

  io.pri_o:=pri_o
  io.po_a:=po_a_l
  io.po_b:=po_b_l
  io.int_req:=int_req_l

  when (io.ce) {
    //-------------------------------
    // LFSR TIMER
    tdiv:=tdiv+1
    when (tdiv===0) {
      tim(0):=(tim(3) ^ tim(4)) ^ !(tim(5) ^ tim(7))
      tim(7 downto 1):=tim(6 downto 0)
    }
    tim_int:=(tim===0xFE)
    tim_int_d:=tim_int;

    // Interrupts
    ext_int_d:=io.ext_int

    inta_set:=(!ext_int_d & io.ext_int & (icr === U"01")) |
              (!tim_int_d & tim_int & (icr === U"11"))

    inta :=(inta | inta_set) & !inta_clr

    int_req_l:=inta & io.pri_i
    pri_o := io.pri_i & !inta

    //-------------------------------
    switch (io_port(1 downto 0)) {
      is (U"00") { // IO PORT A READ
        io_dr:=io.pi_a & po_a_l
      }
      is (U"01") { // IO PORT B READ
        io_dr:=io.pi_b & po_b_l
      }
      is (U"10") { // Interrupt control bits
        io_dr:=U"h00" // <TBD>
      }
      default { // Timer
        io_dr:=U"h00" // <TBD>
      }
    }
    when (io_wr) {
      switch (io_port(1 downto 0)) {
        is (U"00") { po_a_l:=io_dw }
        is (U"01") { po_b_l:=io_dw }
        is (U"10") { tim:=io_dw }
        default    { icr:=io_dw(1 downto 0) }
      }
    }

    when (!io.reset_na) {
      po_a_l:=0
      po_b_l:=0
    }
  }

  io.pc0o:=pc0
  io.pc1o:=pc1
  io.dc0o:=dc0
}
