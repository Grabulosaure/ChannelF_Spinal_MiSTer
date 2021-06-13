
package f8
import f8.EnumLen.S
import spinal.core._

import scala.language.postfixOps

class f8_cpu extends Component {
  val io = new Bundle {
    val dr = in(UInt(8 bits)) // Data Read
    val dw = out(UInt(8 bits)) // Data Write / Address
    val dv = out(Bool)

    val romc = out(UInt(5 bits))
    val phase = out(UInt(4 bits))

    val po_a = out(UInt(8 bits))
    val pi_a = in(UInt(8 bits))
    val po_b = out(UInt(8 bits))
    val pi_b = in(UInt(8 bits))

    val ce = in(Bool)
    val acco = out(UInt(8 bits))
    val visaro = out(UInt(6 bits))
    val iozcso = out(UInt(5 bits))
    val reset_na = in(Bool)
  }

  val madrs = Reg(UInt(11 bits)) // 256 * 8 = 2048 microcode entries
  val opcode = Reg(UInt(8 bits))
  val mop = Microcode()
  val acc = Reg(UInt(8 bits))
  val visar = Reg(UInt(6 bits))
  val visarl = UInt(3 bits)
  val rs, rd = UInt(6 bits)
  val scratch_regs = Mem(UInt(8 bits), 64) // Scratch regs
  val sreg_wa = Reg(UInt(6 bits))
  val sreg_wd = Reg(UInt(8 bits))
  val sreg_wr = Reg(Bool)
  val sreg_ra = UInt(6 bits)
  val sreg_rd = UInt(8 bits)
  val iozcs = Reg(UInt(5 bits))
  val alu = Reg(UInt(8 bits))
  val dstm = Reg(Bool)
  val test, testp, bcc, bccp = Reg(Bool)
  val poa_l, pob_l = Reg(UInt(8 bits))
  val phase_l = Reg(UInt(4 bits))
  val dw = Reg(UInt(8 bits))
  val dv = Reg(Bool)
  //val txt = String

  val dec = new Decode
  import dec._
  io.po_a := poa_l
  io.po_b := pob_l
  io.phase := phase_l
  io.dw := dw
  io.dv := dv
  visarl := visar(2 downto 0)

  when((bcc && test) || (opcode===0x8F && visarl=/=7 && mop.romc===3)) {
    io.romc := 1
  } elsewhen ((bcc && !test) || (opcode===0x8F && visarl===7 && mop.romc===3)) {
    io.romc := 3
  } otherwise {
    io.romc := mop.romc
  }

  when(mop.rs < 16) {
    sreg_ra := mop.rs.resized
  } elsewhen (mop.rd < 16) {
    sreg_ra := mop.rd.resized
  } otherwise {
    sreg_ra := visar
  }

  sreg_rd := scratch_regs.readSync(sreg_ra)
  scratch_regs.write(sreg_wa, sreg_wd, sreg_wr)

  //----------------------------------------------------------
  val iozcs_v = UInt(5 bits)
  val len_v = Reg(EnumLen())

  val Micro = Mem(f8.Microcode(), 2048)
  Micro.init(MICROCODE)
  mop := Micro.readSync(madrs, io.ce)

  when (io.ce) {
    var rs1_v, rs2_v = UInt(8 bits)
    rs1_v := acc
    rs2_v := acc
    sreg_wr := False

    when((bcc && test) || (opcode===0x8F && visarl===7)) {
      len_v := EnumLen.L
    } elsewhen ((bcc && !test) || (opcode===0x8F && visarl=/=7)) {
      len_v := EnumLen.S
    } otherwise {
      len_v := mop.len
    }

    when(phase_l===7 && (len_v===S)) {
      phase_l := 0
    } elsewhen (phase_l===11 && (len_v===EnumLen.L)) {
      phase_l := 0
    } otherwise {
      phase_l := phase_l + 1
    }

    switch(phase_l) {
      is(0) {
        test := testp
        bcc := bccp
      }
      is(1) {}
      is(2) {} // <dw ==> <AVOIR>
      is(3) {
        switch(mop.rd) {
          is(RACC) {
            rs1_v \= acc
          }
          is(R0, R1, R2, R3, R4, R5, R6, R7, R8, R9, R10, R11, R12, R13, R14, R15) {
            rs1_v \= sreg_rd
          }
          is(RISAR, RISARP, RISARM) {
            rs1_v \= sreg_rd
          }
          is(DATA) {
            rs1_v \= io.dr
          }
          default {
            rs1_v \= acc
          }
        }
        switch(mop.rs) {
          is(PORT0) {
            rs2_v \= io.pi_a
          }
          is(PORT1) {
            rs2_v \= io.pi_b
          }
          is(RACC) {
            rs2_v \= acc
          }
          is(R0, R1, R2, R3, R4, R5, R6, R7, R8, R9, R10, R11, R12, R13, R14, R15) {
            rs2_v \= sreg_rd
          }
          is(RISAR, RISARP, RISARM) {
            rs2_v \= sreg_rd
          }
          is(WREG) {
            rs2_v \= iozcs.resize(8)
          }
          is(ISAR) {
            rs2_v \= visar.resize(8)
          }
          is(DATA) {
            rs2_v \= io.dr
          }
          default {
            rs2_v \= acc
          }
        }

        val al = new f8.aluop
        al.io.op:=mop.op
        al.io.code:=opcode
        al.io.src1:=rs1_v
        al.io.src2:=rs2_v
        al.io.iozcs_i:=iozcs
        alu := al.io.dst
        dstm := al.io.dstm
        iozcs := al.io.iozcs_o
        testp := al.io.test
        bccp := (mop.op === EnumOp.OP_TST8 || mop.op === EnumOp.OP_TST9)
      }
      is(4) {
        dv := False
        when(dstm) {
          switch(mop.rd) {
            is(RACC) {
              acc := alu
            }
            is(PORT0) {
              poa_l := alu
            }
            is(PORT1) {
              pob_l := alu
            }
            is(WREG) {
              iozcs := alu(4 downto 0)
            }
            is(ISARU) {
              visar(5 downto 3) := alu(2 downto 0)
            }
            is(ISARL) {
              visar(2 downto 0) := alu(2 downto 0)
            }
            is(ISAR) {
              visar := alu(5 downto 0)
            }
            is(R0, R1, R2, R3, R4, R5, R6, R7, R8, R9, R10, R11, R12, R13, R14, R15) {
              sreg_wd := alu
              sreg_wa := mop.rd.resized
              sreg_wr := True
            }
            is(RISAR, RISARP, RISARM) {
              sreg_wd := alu
              sreg_wa := visar
              sreg_wr := True
            }
            is(DATA) {
              dw := alu
              dv := True
            }
            default {
            }
          }
        }
      }
      is(5) {
        when(mop.rs === RISARP || mop.rd === RISARP) {
          visar(2 downto 0) := visar(2 downto 0) + 1
        }
        when(mop.rs === RISARM || mop.rd === RISARM) {
          visar(2 downto 0) := visar(2 downto 0) - 1
        }
      }
      is(7) {
        when(len_v === EnumLen.S) {
          when(mop.romc === 0) { // IFETCH
            opcode := io.dr
            madrs := io.dr @@ U"000"
          } otherwise {
            madrs := madrs + 1
          }
        }
      }
      is(11) {
        when(len_v === EnumLen.L) {
          when(mop.romc === 0) { // IFETCH
            opcode := io.dr
            madrs := io.dr @@ U"000"
          } otherwise {
            madrs := madrs + 1
          }
        }
      }
      default { // NULL
      }
    }

    when(!io.reset_na) {
      opcode := OP_RESET
      madrs := OP_RESET * 8
      phase_l := 0
      iozcs := 0
    }
  }
  io.acco := acc
  io.visaro := visar
  io.iozcso := iozcs
}
