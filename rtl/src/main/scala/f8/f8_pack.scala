
package f8

import spinal.core._
import scala.language.postfixOps

class cEnumLen extends SpinalEnum { val S,L = newElement() }
class cEnumInt extends SpinalEnum { val I0,IX,IY = newElement() }
class cEnumOp  extends SpinalEnum { val
    OP_NOP,OP_MOV,OP_ADD,OP_ADDD,OP_AND,OP_OR ,OP_XOR,OP_CMP,
    OP_SR1,OP_SL1,OP_SR4, OP_SL4,OP_COM,OP_LNK,OP_EDI,
    OP_INC,OP_DEC,OP_LIS,OP_TST8,OP_TST9 = newElement() }

object EnumLen extends cEnumLen
object EnumInt extends cEnumInt
object EnumOp  extends cEnumOp

case class Microcode() extends Bundle {
  val romc = UInt(5 bits)
  val len = EnumLen()
  val last = Bool
  val int = EnumInt()
  val op = EnumOp()
  val rd = UInt(5 bits)
  val rs = UInt(5 bits)
}

class Decode {
  val OP_RESET = 0x2F
  val OP_INTERRUPT = 0x2E

  //////////////////////////////////////
  val R0 = 0
  val R1 = 1
  val R2 = 2
  val R3 = 3
  val R4 = 4
  val R5 = 5
  val R6 = 6
  val R7 = 7
  val R8 = 8
  val R9 = 9
  val R10 = 10
  val R11 = 11
  val R12 = 12
  val R13 = 13
  val R14 = 14
  val R15 = 15

  val RACC = 0x10

  val WREG = 0x11
  val ISARU = 0x12
  val ISARL = 0x13
  val ISAR = 0x14

  val RISAR = 0x15
  val RISARP = 0x16
  val RISARM = 0x17

  val PORT0 = 0x18
  val PORT1 = 0x19

  val DATA = 0x1F

  import EnumInt._
  import EnumLen._
  import EnumOp._

  def MM(promc: Int,
         plen: SpinalEnumElement[cEnumLen],
         plast: Int,
         pint: SpinalEnumElement[cEnumInt],
         pop: SpinalEnumElement[cEnumOp],
         prd: Int,
         prs: Int): Microcode = {
    val m = Microcode()
    m.romc := U(promc, 5 bits)
    m.len := plen
    if (plast == 1) {
      m.last := True
    } else {
      m.last := False
    }
    m.int := pint
    m.op := pop
    m.rd := U(prd, 5 bits)
    m.rs := U(prs, 5 bits)
    m
  }

  val ZZ = MM(0, S, 1, I0, OP_NOP, RACC, RACC)

  val MICROCODE = Array(
    // ROMC CYC LAST INT ALUOP RDEST RSRC
    //  6    2   1    2   4     5     5
    MM(0x00, S, 1, I0, OP_MOV, RACC, R12),
    ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, // 00 : A <= r12              : LR A,KU : Load r12
    MM(0x00, S, 1, I0, OP_MOV, RACC, R13), ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, // 01 : A <= r13              : LR A,KL : Load r13
    MM(0x00, S, 1, I0, OP_MOV, RACC, R14), ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, // 02 : A <= r14              : LR A,QU : Load r14
    MM(0x00, S, 1, I0, OP_MOV, RACC, R15), ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, // 03 : A <= r15              : LR A,QL : Load r15
    MM(0x00, S, 1, I0, OP_MOV, R12, RACC), ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, // 04 : r12 <= A              : LR KU,A : Store r12
    MM(0x00, S, 1, I0, OP_MOV, R13, RACC), ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, // 05 : r13 <= A              : LR KL,A : Store r13
    MM(0x00, S, 1, I0, OP_MOV, R14, RACC), ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, // 06 : r14 <= A              : LR QU,A : Store r14
    MM(0x00, S, 1, I0, OP_MOV, R15, RACC), ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, // 07 : r15 <= A              : LR QL,A : Store r15
    MM(0x07, L, 0, I0, OP_MOV, R12, DATA), // 08 : r12 <= data <= PC1U   : LR K,P  : Store stack reg.
    MM(0x0B, L, 0, I0, OP_MOV, R13, DATA), //      r13 <= data <= PC1L
    MM(0x00, S, 1, I0, OP_NOP, RACC, RACC), ZZ, ZZ, ZZ, ZZ, ZZ,
    MM(0x15, L, 0, I0, OP_MOV, DATA, R12), // 09 : PC1U <= data <= r12   : LR P,K  : Load stack reg.
    MM(0x18, L, 0, I0, OP_MOV, DATA, R13), //      PC1L <= data <= r13
    MM(0x00, S, 1, I0, OP_NOP, RACC, RACC), ZZ, ZZ, ZZ, ZZ, ZZ,
    MM(0x00, S, 1, I0, OP_MOV, RACC, ISAR), ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, // 0A : ACC <= ISAR           : LR A,IS : Store ISAR
    MM(0x00, S, 1, I0, OP_MOV, ISAR, RACC), ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, // 0B : ISAR <= ACC           : LR IS,A : Load ISAR
    MM(0x12, L, 0, I0, OP_MOV, DATA, R13), // 0C : PC1 <= PC0 PC0L <= data <= R13  : PK      : Call subroutine
    MM(0x14, L, 0, I0, OP_MOV, DATA, R12), //      PC0U <= data <= R12
    MM(0x00, S, 1, IX, OP_NOP, RACC, RACC), ZZ, ZZ, ZZ, ZZ, ZZ,
    MM(0x17, L, 0, I0, OP_MOV, DATA, R15), // 0D : PC0L <= data <= R15   : LR      : Load Program Counter
    MM(0x14, L, 0, I0, OP_MOV, DATA, R14), //      PC0U <= data <= R14
    MM(0x00, S, 1, I0, OP_NOP, RACC, RACC), ZZ, ZZ, ZZ, ZZ, ZZ,
    MM(0x06, L, 0, I0, OP_MOV, R14, DATA), // 0E : R14 <= data <= DC0U   : LR Q,DC : Store d count r14/15
    MM(0x09, L, 0, I0, OP_MOV, R15, DATA), //      R15 <= data <= DC0L
    MM(0x00, S, 1, I0, OP_NOP, RACC, RACC), ZZ, ZZ, ZZ, ZZ, ZZ,
    MM(0x16, L, 0, I0, OP_MOV, DATA, R14), // 0F : DC0U <= data <= R14   : LR DC,Q : Load d count r14/15
    MM(0x19, L, 0, I0, OP_MOV, DATA, R15), //      DC0L <= data <= R15
    MM(0x00, S, 1, I0, OP_NOP, RACC, RACC), ZZ, ZZ, ZZ, ZZ, ZZ,
    MM(0x16, L, 0, I0, OP_MOV, DATA, R10), // 10 : DC0U <= data <= R10   : LR DC,H : Load d count r10/11
    MM(0x19, L, 0, I0, OP_MOV, DATA, R11), //      DC0L <= data <= R11
    MM(0x00, S, 1, I0, OP_NOP, RACC, RACC), ZZ, ZZ, ZZ, ZZ, ZZ,
    MM(0x06, L, 0, I0, OP_MOV, R10, DATA), // 11 : R10 <= data <= DC0U   : LR H,DC : Store d count r10/11
    MM(0x09, L, 0, I0, OP_MOV, R11, DATA), //      R11 <= data <= DC0L
    MM(0x00, S, 1, I0, OP_NOP, RACC, RACC), ZZ, ZZ, ZZ, ZZ, ZZ,
    MM(0x00, S, 1, I0, OP_SR1, RACC, RACC), ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, // 12 : ACC <= ACC >> 1       : SR   1  : Shift right one
    MM(0x00, S, 1, I0, OP_SL1, RACC, RACC), ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, // 13 : ACC <= ACC << 1       : SL   1  : Shift left one
    MM(0x00, S, 1, I0, OP_SR4, RACC, RACC), ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, // 14 : ACC <= ACC >> 4       : SR   4  : Shift right four
    MM(0x00, S, 1, I0, OP_SL4, RACC, RACC), ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, // 15 : ACC <= ACC << 4       : SL   4  : Shift left four
    MM(0x02, L, 0, I0, OP_MOV, RACC, DATA), // 16 : ACC <= DATA <= [DC0]  : LM      : LOAD mem DC0
    MM(0x00, S, 1, I0, OP_NOP, RACC, RACC), ZZ, ZZ, ZZ, ZZ, ZZ, ZZ,
    MM(0x05, L, 0, I0, OP_MOV, DATA, RACC), // 17 : [DC] <= DATA <= ACC   : ST      : STORE  mem DC0
    MM(0x00, S, 1, I0, OP_NOP, RACC, RACC), ZZ, ZZ, ZZ, ZZ, ZZ, ZZ,
    MM(0x00, S, 1, I0, OP_COM, RACC, RACC), ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, // 18 : ACC <= !ACC           : COM     : Complement acc.
    MM(0x00, S, 1, I0, OP_LNK, RACC, RACC), ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, // 19 : ACC <= ACC + carry    : LNK     : Add Carry acc.
    MM(0x1C, S, 0, IY, OP_EDI, RACC, RACC), // 1A : Clear ICB             : DI      : Disable Interrupt
    MM(0x00, S, 1, I0, OP_NOP, RACC, RACC), ZZ, ZZ, ZZ, ZZ, ZZ, ZZ,
    MM(0x1C, S, 0, I0, OP_EDI, RACC, RACC), // 1B : Set ICB               : EI      : Enable Interrupt
    MM(0x00, S, 1, IX, OP_NOP, RACC, RACC), ZZ, ZZ, ZZ, ZZ, ZZ, ZZ,
    MM(0x04, S, 0, I0, OP_NOP, RACC, RACC), // 1C : PC0 <= PC1            : POP     : Return from sub
    MM(0x00, S, 1, IX, OP_NOP, RACC, RACC), ZZ, ZZ, ZZ, ZZ, ZZ, ZZ,
    MM(0x1C, S, 0, I0, OP_MOV, WREG, R9), // 1D : W <= R9 statusreg     : LR W,J  : Load Status reg r9
    MM(0x00, S, 1, IX, OP_NOP, RACC, RACC), ZZ, ZZ, ZZ, ZZ, ZZ, ZZ,
    MM(0x00, S, 1, I0, OP_MOV, R9, WREG), ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, // 1E : R9 <= W statusreg     : LR J,W  : Store Status reg r9
    MM(0x00, S, 1, I0, OP_INC, RACC, RACC), ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, // 1F : ACC <= ACC + 1        : INC     : Increment
    MM(0x03, L, 0, I0, OP_MOV, RACC, DATA), // 20 II : ACC <= IMM         : LI ii   : LOAD immediate acc.
    MM(0x00, S, 1, I0, OP_NOP, RACC, RACC), ZZ, ZZ, ZZ, ZZ, ZZ, ZZ,
    MM(0x03, L, 0, I0, OP_AND, RACC, DATA), // 21 II : ACC <= ACC & IMM   : NI   ii : AND immediate acc.
    MM(0x00, S, 1, I0, OP_NOP, RACC, RACC), ZZ, ZZ, ZZ, ZZ, ZZ, ZZ,
    MM(0x03, L, 0, I0, OP_OR, RACC, DATA), // 22 II : ACC <= ACC | IMM   : OI   ii : OR  immediate acc.
    MM(0x00, S, 1, I0, OP_NOP, RACC, RACC), ZZ, ZZ, ZZ, ZZ, ZZ, ZZ,
    MM(0x03, L, 0, I0, OP_XOR, RACC, DATA), // 23 II : ACC <= ACC ^ IMM   : XI   ii : XOR immediate acc.
    MM(0x00, S, 1, I0, OP_NOP, RACC, RACC), ZZ, ZZ, ZZ, ZZ, ZZ, ZZ,
    MM(0x03, L, 0, I0, OP_ADD, RACC, DATA), // 24 II : ACC <= ACC + IMM   : AI   ii : ADD immediate acc.
    MM(0x00, S, 1, I0, OP_NOP, RACC, RACC), ZZ, ZZ, ZZ, ZZ, ZZ, ZZ,
    MM(0x03, L, 0, I0, OP_CMP, RACC, DATA), // 25 II : CMP (ACC,IMM)      : CI   ii : CMP immediate acc.
    MM(0x00, S, 1, I0, OP_NOP, RACC, RACC), ZZ, ZZ, ZZ, ZZ, ZZ, ZZ,
    MM(0x03, L, 0, I0, OP_NOP, RACC, RACC), // 26 II : (fetch operand)    : IN   aa : Input port aa
    MM(0x1B, L, 0, I0, OP_MOV, RACC, DATA), //         ACC <= IOport[DB]
    MM(0x00, S, 1, I0, OP_NOP, RACC, RACC), ZZ, ZZ, ZZ, ZZ, ZZ,
    MM(0x03, L, 0, I0, OP_NOP, RACC, RACC), // 27 II : (fetch operand)    : OUT  aa : Output port aa
    MM(0x1A, L, 0, I0, OP_MOV, DATA, RACC), //         IOport[DB] <= ACC
    MM(0x00, S, 1, IX, OP_NOP, RACC, RACC), ZZ, ZZ, ZZ, ZZ, ZZ,
    MM(0x03, L, 0, I0, OP_MOV, RACC, DATA), // 28 AAAA : ACC <= DATA (immediate)  : PI  aaaa : Call Subroutine
    MM(0x0D, S, 0, I0, OP_NOP, RACC, RACC), //           PC1 <= PC0 + 1
    MM(0x0C, L, 0, I0, OP_MOV, DATA, DATA), //           PC0L <= DATA (immediate)
    MM(0x14, L, 0, I0, OP_MOV, DATA, RACC), //           PC0U <= DATA <= ACC
    MM(0x00, S, 1, IX, OP_NOP, RACC, RACC), ZZ, ZZ, ZZ,
    MM(0x03, L, 0, I0, OP_MOV, RACC, DATA), // 29 AAAA : ACC <= DATA (immediate)  : JMP aaaa : JUMP
    MM(0x0C, L, 0, I0, OP_MOV, DATA, DATA), //           PC0L <= DATA (immediate)
    MM(0x14, L, 0, I0, OP_MOV, DATA, RACC), //           PC0U <= DATA <= ACC
    MM(0x00, S, 1, IX, OP_NOP, RACC, RACC), ZZ, ZZ, ZZ, ZZ,
    MM(0x11, L, 0, I0, OP_MOV, DATA, DATA), // 2A AAAA : DC0U <= DATA (immediate)  : DCI aaaa : Load DC imm.
    MM(0x03, S, 0, I0, OP_NOP, RACC, RACC), //           PC0 ++
    MM(0x0E, L, 0, I0, OP_MOV, DATA, DATA), //           DC0L <= DATA (immediate)
    MM(0x03, S, 0, I0, OP_NOP, RACC, RACC), //           PC0 ++
    MM(0x00, S, 1, I0, OP_NOP, RACC, RACC), ZZ, ZZ, ZZ,

    MM(0x00, S, 1, I0, OP_NOP, RACC, RACC), ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, // 2B      : No Operation              : NOP

    MM(0x1D, S, 1, I0, OP_NOP, RACC, RACC), // 2C      : DC0 <=> DC1               : XDC
    MM(0x00, S, 1, I0, OP_NOP, RACC, RACC), ZZ, ZZ, ZZ, ZZ, ZZ, ZZ,

    MM(0x00, S, 1, I0, OP_NOP, RACC, RACC), ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, // 2D      : Undefined ?               : NOP

    // INTERRUPT (undef opcode) //////////////////////////-
    MM(0x1C, L, 0, I0, OP_NOP, RACC, RACC), // 2E      :                           :
    MM(0x0F, L, 0, I0, OP_NOP, RACC, RACC), //           PC0L <= int vect low, PC1 <= PC0
    MM(0x13, L, 0, IY, OP_NOP, RACC, RACC), //           PC0U <= int vect high
    MM(0x00, S, 1, IX, OP_NOP, RACC, RACC), ZZ, ZZ, ZZ, ZZ,

    // RESET (undef opcode) //////////////////////////////-
    MM(0x1C, S, 0, I0, OP_NOP, RACC, RACC), // 2F      :
    MM(0x08, L, 0, IY, OP_NOP, RACC, RACC), //           PC0 <= 0 PC1 <= PC0
    MM(0x00, S, 1, IX, OP_NOP, RACC, RACC), ZZ, ZZ, ZZ, ZZ, ZZ,

    MM(0x00, L, 1, I0, OP_DEC, R0, R0), ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, // 30 : R0 //                       : DS   R0    : Decrement  R0
    MM(0x00, L, 1, I0, OP_DEC, R1, R1), ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, // 31 : R1 //                       : DS   R1    : Decrement  R1
    MM(0x00, L, 1, I0, OP_DEC, R2, R2), ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, // 32 : R2 //                       : DS   R2    : Decrement  R2
    MM(0x00, L, 1, I0, OP_DEC, R3, R3), ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, // 33 : R3 //                       : DS   R3    : Decrement  R3
    MM(0x00, L, 1, I0, OP_DEC, R4, R4), ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, // 34 : R4 //                       : DS   R4    : Decrement  R4
    MM(0x00, L, 1, I0, OP_DEC, R5, R5), ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, // 35 : R5 //                       : DS   R5    : Decrement  R5
    MM(0x00, L, 1, I0, OP_DEC, R6, R6), ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, // 36 : R6 //                       : DS   R6    : Decrement  R6
    MM(0x00, L, 1, I0, OP_DEC, R7, R7), ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, // 37 : R7 //                       : DS   R7    : Decrement  R7
    MM(0x00, L, 1, I0, OP_DEC, R8, R8), ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, // 38 : R8 //                       : DS   R8    : Decrement  R8
    MM(0x00, L, 1, I0, OP_DEC, R9, R9), ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, // 39 : R9 //                       : DS   R9    : Decrement  R9
    MM(0x00, L, 1, I0, OP_DEC, R10, R10), ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, // 3A : R10//                       : DS   R10   : Decrement  R10
    MM(0x00, L, 1, I0, OP_DEC, R11, R11), ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, // 3B : R11//                       : DS   R11   : Decrement  R11
    MM(0x00, L, 1, I0, OP_DEC, RISAR, RISAR), ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, // 3C : (ISAR)//                    : DS (ISAR)  : Decrement  (ISAR)
    MM(0x00, L, 1, I0, OP_DEC, RISARP, RISARP), ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, // 3D : (ISAR++)//                  : DS (ISAR+) : Decrement  (ISAR++)
    MM(0x00, L, 1, I0, OP_DEC, RISARM, RISARM), ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, // 3E : (ISAR//)//                  : DS (ISAR-) : Decrement  (ISAR//)
    MM(0x00, L, 1, I0, OP_DEC, R15, R15), ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, // 3F : R15// <INVALID>             : DS   R15   : Decrement  R15

    MM(0x00, S, 1, I0, OP_MOV, RACC, R0), ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, // 40 : ACC <= R0                   : LR A,R0      : LOAD    R0
    MM(0x00, S, 1, I0, OP_MOV, RACC, R1), ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, // 41 : ACC <= R1                   : LR A,R1      : LOAD    R1
    MM(0x00, S, 1, I0, OP_MOV, RACC, R2), ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, // 42 : ACC <= R2                   : LR A,R2      : LOAD    R2
    MM(0x00, S, 1, I0, OP_MOV, RACC, R3), ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, // 43 : ACC <= R3                   : LR A,R3      : LOAD    R3
    MM(0x00, S, 1, I0, OP_MOV, RACC, R4), ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, // 44 : ACC <= R4                   : LR A,R4      : LOAD    R4
    MM(0x00, S, 1, I0, OP_MOV, RACC, R5), ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, // 45 : ACC <= R5                   : LR A,R5      : LOAD    R5
    MM(0x00, S, 1, I0, OP_MOV, RACC, R6), ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, // 46 : ACC <= R6                   : LR A,R6      : LOAD    R6
    MM(0x00, S, 1, I0, OP_MOV, RACC, R7), ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, // 47 : ACC <= R7                   : LR A,R7      : LOAD    R7
    MM(0x00, S, 1, I0, OP_MOV, RACC, R8), ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, // 48 : ACC <= R8                   : LR A,R8      : LOAD    R8
    MM(0x00, S, 1, I0, OP_MOV, RACC, R9), ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, // 49 : ACC <= R9                   : LR A,R9      : LOAD    R9
    MM(0x00, S, 1, I0, OP_MOV, RACC, R10), ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, // 4A : ACC <= R10                  : LR A,R10     : LOAD    R10
    MM(0x00, S, 1, I0, OP_MOV, RACC, R11), ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, // 4B : ACC <= R11                  : LR A,R11     : LOAD    R11
    MM(0x00, S, 1, I0, OP_MOV, RACC, RISAR), ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, // 4C : ACC <= (ISAR)               : LR A,(ISAR)  : LOAD    (ISAR)
    MM(0x00, S, 1, I0, OP_MOV, RACC, RISARP), ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, // 4D : ACC <= (ISAR++)             : LR A,(ISAR+) : LOAD    (ISAR++)
    MM(0x00, S, 1, I0, OP_MOV, RACC, RISARM), ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, // 4E : ACC <= (ISAR//)             : LR A,(ISAR-) : LOAD    (ISAR//)
    MM(0x00, S, 1, I0, OP_MOV, RACC, R15), ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, // 4F : ACC <= R15  <INVALID>       : LR A,R15     : LOAD    R15

    MM(0x00, S, 1, I0, OP_MOV, R0, RACC), ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, // 50 : R0  <= ACC                  : LR R0 ,A     : STORE   R0
    MM(0x00, S, 1, I0, OP_MOV, R1, RACC), ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, // 51 : R1  <= ACC                  : LR R1 ,A     : STORE   R1
    MM(0x00, S, 1, I0, OP_MOV, R2, RACC), ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, // 52 : R2  <= ACC                  : LR R2 ,A     : STORE   R2
    MM(0x00, S, 1, I0, OP_MOV, R3, RACC), ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, // 53 : R3  <= ACC                  : LR R3 ,A     : STORE   R3
    MM(0x00, S, 1, I0, OP_MOV, R4, RACC), ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, // 54 : R4  <= ACC                  : LR R4 ,A     : STORE   R4
    MM(0x00, S, 1, I0, OP_MOV, R5, RACC), ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, // 55 : R5  <= ACC                  : LR R5 ,A     : STORE   R5
    MM(0x00, S, 1, I0, OP_MOV, R6, RACC), ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, // 56 : R6  <= ACC                  : LR R6 ,A     : STORE   R6
    MM(0x00, S, 1, I0, OP_MOV, R7, RACC), ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, // 57 : R7  <= ACC                  : LR R7 ,A     : STORE   R7
    MM(0x00, S, 1, I0, OP_MOV, R8, RACC), ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, // 58 : R8  <= ACC                  : LR R8 ,A     : STORE   R8
    MM(0x00, S, 1, I0, OP_MOV, R9, RACC), ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, // 59 : R9  <= ACC                  : LR R9 ,A     : STORE   R9
    MM(0x00, S, 1, I0, OP_MOV, R10, RACC), ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, // 5A : R10 <= ACC                  : LR R10,A     : STORE   R10
    MM(0x00, S, 1, I0, OP_MOV, R11, RACC), ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, // 5B : R11 <= ACC                  : LR R11,A     : STORE   R11
    MM(0x00, S, 1, I0, OP_MOV, RISAR, RACC), ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, // 5C : (ISAR) <= ACC               : LR (ISAR),A  : STORE   (ISAR)
    MM(0x00, S, 1, I0, OP_MOV, RISARP, RACC), ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, // 5D : (ISAR++) <= ACC             : LR (ISAR+),A : STORE   (ISAR++)
    MM(0x00, S, 1, I0, OP_MOV, RISARM, RACC), ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, // 5E : (ISAR//) <= ACC             : LR (ISAR-),A : STORE   (ISAR//)
    MM(0x00, S, 1, I0, OP_MOV, R15, RACC), ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, // 5F : R15 <= ACC  <INVALID>       : LR R15,A     : STORE   R15

    MM(0x00, S, 1, I0, OP_LIS, ISARU, R0), ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, // 60 : ISARU <= 0                     : LISU 0    : Load ISAR upper
    MM(0x00, S, 1, I0, OP_LIS, ISARU, R1), ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, // 61 : ISARU <= 1                     : LISU 1    : Load ISAR upper
    MM(0x00, S, 1, I0, OP_LIS, ISARU, R2), ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, // 62 : ISARU <= 2                     : LISU 2    : Load ISAR upper
    MM(0x00, S, 1, I0, OP_LIS, ISARU, R3), ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, // 63 : ISARU <= 3                     : LISU 3    : Load ISAR upper
    MM(0x00, S, 1, I0, OP_LIS, ISARU, R4), ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, // 64 : ISARU <= 4                     : LISU 4    : Load ISAR upper
    MM(0x00, S, 1, I0, OP_LIS, ISARU, R5), ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, // 65 : ISARU <= 5                     : LISU 5    : Load ISAR upper
    MM(0x00, S, 1, I0, OP_LIS, ISARU, R6), ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, // 66 : ISARU <= 6                     : LISU 6    : Load ISAR upper
    MM(0x00, S, 1, I0, OP_LIS, ISARU, R7), ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, // 67 : ISARU <= 7                     : LISU 7    : Load ISAR upper

    MM(0x00, S, 1, I0, OP_LIS, ISARL, R0), ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, // 68 : ISARL <= 0                     : LISL 0    : Load ISAR lower
    MM(0x00, S, 1, I0, OP_LIS, ISARL, R1), ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, // 69 : ISARL <= 1                     : LISL 1    : Load ISAR lower
    MM(0x00, S, 1, I0, OP_LIS, ISARL, R2), ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, // 6A : ISARL <= 2                     : LISL 2    : Load ISAR lower
    MM(0x00, S, 1, I0, OP_LIS, ISARL, R3), ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, // 6B : ISARL <= 3                     : LISL 3    : Load ISAR lower
    MM(0x00, S, 1, I0, OP_LIS, ISARL, R4), ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, // 6C : ISARL <= 4                     : LISL 4    : Load ISAR lower
    MM(0x00, S, 1, I0, OP_LIS, ISARL, R5), ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, // 6D : ISARL <= 5                     : LISL 5    : Load ISAR lower
    MM(0x00, S, 1, I0, OP_LIS, ISARL, R6), ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, // 6E : ISARL <= 6                     : LISL 6    : Load ISAR lower
    MM(0x00, S, 1, I0, OP_LIS, ISARL, R7), ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, // 6F : ISARL <= 7                     : LISL 7    : Load ISAR lower

    MM(0x00, S, 1, I0, OP_LIS, RACC, RACC), ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, // 70 : ACC <= 0                       : LIS 0     : Load ACC 0 / CLR ACC
    MM(0x00, S, 1, I0, OP_LIS, RACC, RACC), ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, // 71 : ACC <= 1                       : LIS 1     : Load ACC 1
    MM(0x00, S, 1, I0, OP_LIS, RACC, RACC), ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, // 72 : ACC <= 2                       : LIS 2     : Load ACC 2
    MM(0x00, S, 1, I0, OP_LIS, RACC, RACC), ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, // 73 : ACC <= 3                       : LIS 3     : Load ACC 3
    MM(0x00, S, 1, I0, OP_LIS, RACC, RACC), ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, // 74 : ACC <= 4                       : LIS 4     : Load ACC 4
    MM(0x00, S, 1, I0, OP_LIS, RACC, RACC), ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, // 75 : ACC <= 5                       : LIS 5     : Load ACC 5
    MM(0x00, S, 1, I0, OP_LIS, RACC, RACC), ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, // 76 : ACC <= 6                       : LIS 6     : Load ACC 6
    MM(0x00, S, 1, I0, OP_LIS, RACC, RACC), ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, // 77 : ACC <= 7                       : LIS 7     : Load ACC 7
    MM(0x00, S, 1, I0, OP_LIS, RACC, RACC), ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, // 78 : ACC <= 8                       : LIS 8     : Load ACC 8
    MM(0x00, S, 1, I0, OP_LIS, RACC, RACC), ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, // 79 : ACC <= 9                       : LIS 9     : Load ACC 9
    MM(0x00, S, 1, I0, OP_LIS, RACC, RACC), ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, // 7A : ACC <= 10                      : LIS 10    : Load ACC 10
    MM(0x00, S, 1, I0, OP_LIS, RACC, RACC), ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, // 7B : ACC <= 11                      : LIS 11    : Load ACC 11
    MM(0x00, S, 1, I0, OP_LIS, RACC, RACC), ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, // 7C : ACC <= 12                      : LIS 12    : Load ACC 12
    MM(0x00, S, 1, I0, OP_LIS, RACC, RACC), ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, // 7D : ACC <= 13                      : LIS 13    : Load ACC 13
    MM(0x00, S, 1, I0, OP_LIS, RACC, RACC), ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, // 7E : ACC <= 14                      : LIS 14    : Load ACC 14
    MM(0x00, S, 1, I0, OP_LIS, RACC, RACC), ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, // 7F : ACC <= 15                      : LIS 15    : Load ACC 15

    MM(0x1C, S, 0, I0, OP_TST8, RACC, RACC), // 80 : Test 0                         : Bcc  0    : Branch cond.
    MM(0x03, S, 0, I0, OP_NOP, RACC, RACC), //      Test, change PC0 + 2 or +imm
    MM(0x00, S, 1, I0, OP_NOP, RACC, RACC), ZZ, ZZ, ZZ, ZZ, ZZ,
    MM(0x1C, S, 0, I0, OP_TST8, RACC, RACC), // 81 : Test 1                         : Bcc  1    : Branch cond.
    MM(0x03, S, 0, I0, OP_NOP, RACC, RACC), //      Test, change PC0 + 2 or +imm
    MM(0x00, S, 1, I0, OP_NOP, RACC, RACC), ZZ, ZZ, ZZ, ZZ, ZZ,
    MM(0x1C, S, 0, I0, OP_TST8, RACC, RACC), // 82 : Test 2                         : Bcc  2    : Branch cond.
    MM(0x03, S, 0, I0, OP_NOP, RACC, RACC), //      Test, change PC0 + 2 or +imm
    MM(0x00, S, 1, I0, OP_NOP, RACC, RACC), ZZ, ZZ, ZZ, ZZ, ZZ,
    MM(0x1C, S, 0, I0, OP_TST8, RACC, RACC), // 83 : Test 3                         : Bcc  3    : Branch cond.
    MM(0x03, S, 0, I0, OP_NOP, RACC, RACC), //      Test, change PC0 + 2 or +imm
    MM(0x00, S, 1, I0, OP_NOP, RACC, RACC), ZZ, ZZ, ZZ, ZZ, ZZ,
    MM(0x1C, S, 0, I0, OP_TST8, RACC, RACC), // 84 : Test 4                         : Bcc  4    : Branch cond.
    MM(0x03, S, 0, I0, OP_NOP, RACC, RACC), //      Test, change PC0 + 2 or +imm
    MM(0x00, S, 1, I0, OP_NOP, RACC, RACC), ZZ, ZZ, ZZ, ZZ, ZZ,
    MM(0x1C, S, 0, I0, OP_TST8, RACC, RACC), // 85 : Test 5                         : Bcc  5    : Branch cond.
    MM(0x03, S, 0, I0, OP_NOP, RACC, RACC), //      Test, change PC0 + 2 or +imm
    MM(0x00, S, 1, I0, OP_NOP, RACC, RACC), ZZ, ZZ, ZZ, ZZ, ZZ,
    MM(0x1C, S, 0, I0, OP_TST8, RACC, RACC), // 86 : Test 6                         : Bcc  6    : Branch cond.
    MM(0x03, S, 0, I0, OP_NOP, RACC, RACC), //      Test, change PC0 + 2 or +imm
    MM(0x00, S, 1, I0, OP_NOP, RACC, RACC), ZZ, ZZ, ZZ, ZZ, ZZ,
    MM(0x1C, S, 0, I0, OP_TST8, RACC, RACC), // 87 : Test 7                         : Bcc  7    : Branch cond.
    MM(0x03, S, 0, I0, OP_NOP, RACC, RACC), //      Test, change PC0 + 2 or +imm
    MM(0x00, S, 1, I0, OP_NOP, RACC, RACC), ZZ, ZZ, ZZ, ZZ, ZZ,

    MM(0x02, L, 0, I0, OP_ADD, RACC, DATA), // 88 : ACC = ACC + [DC0] , DC0++      : AM      : Add Binary mem
    MM(0x00, S, 1, I0, OP_NOP, RACC, RACC), ZZ, ZZ, ZZ, ZZ, ZZ, ZZ,
    MM(0x02, L, 0, I0, OP_ADDD, RACC, DATA), // 89 : ACC = ACC +D [DC0] , DC0++     : AMD     : Add Decimal mem
    MM(0x00, S, 1, I0, OP_NOP, RACC, RACC), ZZ, ZZ, ZZ, ZZ, ZZ, ZZ,
    MM(0x02, L, 0, I0, OP_AND, RACC, DATA), // 8A : ACC = ACC AND [DC0] , DC0++    : NM      : AND mem
    MM(0x00, S, 1, I0, OP_NOP, RACC, RACC), ZZ, ZZ, ZZ, ZZ, ZZ, ZZ,
    MM(0x02, L, 0, I0, OP_OR, RACC, DATA), // 8B : ACC = ACC OR [DC0] , DC0++     : OM      : OR mem
    MM(0x00, S, 1, I0, OP_NOP, RACC, RACC), ZZ, ZZ, ZZ, ZZ, ZZ, ZZ,
    MM(0x02, L, 0, I0, OP_XOR, RACC, DATA), // 8C : ACC = ACC XOR [DC0] , DC0++    : XM      : XOR mem
    MM(0x00, S, 1, I0, OP_NOP, RACC, RACC), ZZ, ZZ, ZZ, ZZ, ZZ, ZZ,
    MM(0x02, L, 0, I0, OP_CMP, RACC, DATA), // 8D : CMP(ACC,[DC0])      , DC0++    : CM      : CMP mem
    MM(0x00, S, 1, I0, OP_NOP, RACC, RACC), ZZ, ZZ, ZZ, ZZ, ZZ, ZZ,
    MM(0x0A, L, 0, I0, OP_MOV, DATA, RACC), // 8E : DC = DC + ACC (signed)         : ADC     : Add Data counter
    MM(0x00, S, 1, I0, OP_NOP, RACC, RACC), ZZ, ZZ, ZZ, ZZ, ZZ, ZZ,
    MM(0x03, S, 0, I0, OP_NOP, RACC, RACC), // 8F aa : Test  ISARL, PC +2 or +imm  : BR7 aa  : Branch if ISARlo!=7
    MM(0x00, S, 1, I0, OP_NOP, RACC, RACC), ZZ, ZZ, ZZ, ZZ, ZZ, ZZ,

    MM(0x1C, S, 0, I0, OP_TST9, RACC, RACC), // 90 aa :                             :  BF 0   : Branch if negative
    MM(0x03, S, 0, I0, OP_NOP, RACC, RACC), //      Test, change PC0 + 2 or +imm
    MM(0x00, S, 1, I0, OP_NOP, RACC, RACC), ZZ, ZZ, ZZ, ZZ, ZZ,
    MM(0x1C, S, 0, I0, OP_TST9, RACC, RACC), // 91 aa :                             :  BF 1   : Branch if no carry
    MM(0x03, S, 0, I0, OP_NOP, RACC, RACC), //      Test, change PC0 + 2 or +imm
    MM(0x00, S, 1, I0, OP_NOP, RACC, RACC), ZZ, ZZ, ZZ, ZZ, ZZ,
    MM(0x1C, S, 0, I0, OP_TST9, RACC, RACC), // 92 aa :                             :  BF 2   : Branch if
    MM(0x03, S, 0, I0, OP_NOP, RACC, RACC), //      Test, change PC0 + 2 or +imm
    MM(0x00, S, 1, I0, OP_NOP, RACC, RACC), ZZ, ZZ, ZZ, ZZ, ZZ,
    MM(0x1C, S, 0, I0, OP_TST9, RACC, RACC), // 93 aa :                             :  BF 3   : Branch if
    MM(0x03, S, 0, I0, OP_NOP, RACC, RACC), //      Test, change PC0 + 2 or +imm
    MM(0x00, S, 1, I0, OP_NOP, RACC, RACC), ZZ, ZZ, ZZ, ZZ, ZZ,
    MM(0x1C, S, 0, I0, OP_TST9, RACC, RACC), // 94 aa :                             :  BF 4   : Branch if
    MM(0x03, S, 0, I0, OP_NOP, RACC, RACC), //      Test, change PC0 + 2 or +imm
    MM(0x00, S, 1, I0, OP_NOP, RACC, RACC), ZZ, ZZ, ZZ, ZZ, ZZ,
    MM(0x1C, S, 0, I0, OP_TST9, RACC, RACC), // 95 aa :                             :  BF 5   : Branch if
    MM(0x03, S, 0, I0, OP_NOP, RACC, RACC), //      Test, change PC0 + 2 or +imm
    MM(0x00, S, 1, I0, OP_NOP, RACC, RACC), ZZ, ZZ, ZZ, ZZ, ZZ,
    MM(0x1C, S, 0, I0, OP_TST9, RACC, RACC), // 96 aa :                             :  BF 6   : Branch if
    MM(0x03, S, 0, I0, OP_NOP, RACC, RACC), //      Test, change PC0 + 2 or +imm
    MM(0x00, S, 1, I0, OP_NOP, RACC, RACC), ZZ, ZZ, ZZ, ZZ, ZZ,
    MM(0x1C, S, 0, I0, OP_TST9, RACC, RACC), // 97 aa :                             :  BF 7   : Branch if
    MM(0x03, S, 0, I0, OP_NOP, RACC, RACC), //      Test, change PC0 + 2 or +imm
    MM(0x00, S, 1, I0, OP_NOP, RACC, RACC), ZZ, ZZ, ZZ, ZZ, ZZ,
    MM(0x1C, S, 0, I0, OP_TST9, RACC, RACC), // 98 aa :                             :  BF 8   : Branch if
    MM(0x03, S, 0, I0, OP_NOP, RACC, RACC), //      Test, change PC0 + 2 or +imm
    MM(0x00, S, 1, I0, OP_NOP, RACC, RACC), ZZ, ZZ, ZZ, ZZ, ZZ,
    MM(0x1C, S, 0, I0, OP_TST9, RACC, RACC), // 99 aa :                             :  BF 9   : Branch if
    MM(0x03, S, 0, I0, OP_NOP, RACC, RACC), //      Test, change PC0 + 2 or +imm
    MM(0x00, S, 1, I0, OP_NOP, RACC, RACC), ZZ, ZZ, ZZ, ZZ, ZZ,
    MM(0x1C, S, 0, I0, OP_TST9, RACC, RACC), // 9A aa :                             :  BF A   : Branch if
    MM(0x03, S, 0, I0, OP_NOP, RACC, RACC), //      Test, change PC0 + 2 or +imm
    MM(0x00, S, 1, I0, OP_NOP, RACC, RACC), ZZ, ZZ, ZZ, ZZ, ZZ,
    MM(0x1C, S, 0, I0, OP_TST9, RACC, RACC), // 9B aa :                             :  BF B   : Branch if
    MM(0x03, S, 0, I0, OP_NOP, RACC, RACC), //      Test, change PC0 + 2 or +imm
    MM(0x00, S, 1, I0, OP_NOP, RACC, RACC), ZZ, ZZ, ZZ, ZZ, ZZ,
    MM(0x1C, S, 0, I0, OP_TST9, RACC, RACC), // 9C aa :                             :  BF C   : Branch if
    MM(0x03, S, 0, I0, OP_NOP, RACC, RACC), //      Test, change PC0 + 2 or +imm
    MM(0x00, S, 1, I0, OP_NOP, RACC, RACC), ZZ, ZZ, ZZ, ZZ, ZZ,
    MM(0x1C, S, 0, I0, OP_TST9, RACC, RACC), // 9D aa :                             :  BF D   : Branch if
    MM(0x03, S, 0, I0, OP_NOP, RACC, RACC), //      Test, change PC0 + 2 or +imm
    MM(0x00, S, 1, I0, OP_NOP, RACC, RACC), ZZ, ZZ, ZZ, ZZ, ZZ,
    MM(0x1C, S, 0, I0, OP_TST9, RACC, RACC), // 9E aa :                             :  BF E   : Branch if
    MM(0x03, S, 0, I0, OP_NOP, RACC, RACC), //      Test, change PC0 + 2 or +imm
    MM(0x00, S, 1, I0, OP_NOP, RACC, RACC), ZZ, ZZ, ZZ, ZZ, ZZ,
    MM(0x1C, S, 0, I0, OP_TST9, RACC, RACC), // 9F aa :                             :  BF F   : Branch if
    MM(0x03, S, 0, I0, OP_NOP, RACC, RACC), //      Test, change PC0 + 2 or +imm
    MM(0x00, S, 1, I0, OP_NOP, RACC, RACC), ZZ, ZZ, ZZ, ZZ, ZZ,

    MM(0x1C, S, 0, I0, OP_MOV, RACC, PORT0), // A0 : ACC <= IOPORT[0]               : INS  0  : Input port 0
    MM(0x00, S, 1, I0, OP_NOP, RACC, RACC), ZZ, ZZ, ZZ, ZZ, ZZ, ZZ,
    MM(0x1C, S, 0, I0, OP_MOV, RACC, PORT1), // A1 : ACC <= IOPORT[1]               : INS  1  : Input port 1
    MM(0x00, S, 1, I0, OP_NOP, RACC, RACC), ZZ, ZZ, ZZ, ZZ, ZZ, ZZ,

    MM(0x1C, L, 0, I0, OP_LIS, DATA, R2), // A2 : DATA <= IOPPORTNUM             : INS  2  : Input port 2
    MM(0x1B, L, 0, I0, OP_MOV, RACC, DATA), //      DB <= DATA ioport
    MM(0x00, S, 1, I0, OP_NOP, RACC, RACC), ZZ, ZZ, ZZ, ZZ, ZZ,
    MM(0x1C, L, 0, I0, OP_LIS, DATA, R3), // A3 : DATA <= IOPPORTNUM             : INS  3  : Input port 3
    MM(0x1B, L, 0, I0, OP_MOV, RACC, DATA), //      DB <= DATA ioport
    MM(0x00, S, 1, I0, OP_NOP, RACC, RACC), ZZ, ZZ, ZZ, ZZ, ZZ,
    MM(0x1C, L, 0, I0, OP_LIS, DATA, R4), // A4 : DATA <= IOPPORTNUM             : INS  4  : Input port 4
    MM(0x1B, L, 0, I0, OP_MOV, RACC, DATA), //      DB <= DATA ioport
    MM(0x00, S, 1, I0, OP_NOP, RACC, RACC), ZZ, ZZ, ZZ, ZZ, ZZ,
    MM(0x1C, L, 0, I0, OP_LIS, DATA, R5), // A5 : DATA <= IOPPORTNUM             : INS  5  : Input port 5
    MM(0x1B, L, 0, I0, OP_MOV, RACC, DATA), //      DB <= DATA ioport
    MM(0x00, S, 1, I0, OP_NOP, RACC, RACC), ZZ, ZZ, ZZ, ZZ, ZZ,
    MM(0x1C, L, 0, I0, OP_LIS, DATA, R6), // A6 : DATA <= IOPPORTNUM             : INS  6  : Input port 6
    MM(0x1B, L, 0, I0, OP_MOV, RACC, DATA), //      DB <= DATA ioport
    MM(0x00, S, 1, I0, OP_NOP, RACC, RACC), ZZ, ZZ, ZZ, ZZ, ZZ,
    MM(0x1C, L, 0, I0, OP_LIS, DATA, R7), // A7 : DATA <= IOPPORTNUM             : INS  7  : Input port 7
    MM(0x1B, L, 0, I0, OP_MOV, RACC, DATA), //      DB <= DATA ioport
    MM(0x00, S, 1, I0, OP_NOP, RACC, RACC), ZZ, ZZ, ZZ, ZZ, ZZ,
    MM(0x1C, L, 0, I0, OP_LIS, DATA, R8), // A8 : DATA <= IOPPORTNUM             : INS  8  : Input port 8
    MM(0x1B, L, 0, I0, OP_MOV, RACC, DATA), //      DB <= DATA ioport
    MM(0x00, S, 1, I0, OP_NOP, RACC, RACC), ZZ, ZZ, ZZ, ZZ, ZZ,
    MM(0x1C, L, 0, I0, OP_LIS, DATA, R9), // A9 : DATA <= IOPPORTNUM             : INS  9  : Input port 9
    MM(0x1B, L, 0, I0, OP_MOV, RACC, DATA), //      DB <= DATA ioport
    MM(0x00, S, 1, I0, OP_NOP, RACC, RACC), ZZ, ZZ, ZZ, ZZ, ZZ,
    MM(0x1C, L, 0, I0, OP_LIS, DATA, R10), // AA : DATA <= IOPPORTNUM             : INS  10 : Input port 10
    MM(0x1B, L, 0, I0, OP_MOV, RACC, DATA), //      DB <= DATA ioport
    MM(0x00, S, 1, I0, OP_NOP, RACC, RACC), ZZ, ZZ, ZZ, ZZ, ZZ,
    MM(0x1C, L, 0, I0, OP_LIS, DATA, R11), // AB : DATA <= IOPPORTNUM             : INS  11 : Input port 11
    MM(0x1B, L, 0, I0, OP_MOV, RACC, DATA), //      DB <= DATA ioport
    MM(0x00, S, 1, I0, OP_NOP, RACC, RACC), ZZ, ZZ, ZZ, ZZ, ZZ,
    MM(0x1C, L, 0, I0, OP_LIS, DATA, R12), // AC : DATA <= IOPPORTNUM             : INS  12 : Input port 12
    MM(0x1B, L, 0, I0, OP_MOV, RACC, DATA), //      DB <= DATA ioport
    MM(0x00, S, 1, I0, OP_NOP, RACC, RACC), ZZ, ZZ, ZZ, ZZ, ZZ,
    MM(0x1C, L, 0, I0, OP_LIS, DATA, R13), // AD : DATA <= IOPPORTNUM             : INS  13 : Input port 13
    MM(0x1B, L, 0, I0, OP_MOV, RACC, DATA), //      DB <= DATA ioport
    MM(0x00, S, 1, I0, OP_NOP, RACC, RACC), ZZ, ZZ, ZZ, ZZ, ZZ,
    MM(0x1C, L, 0, I0, OP_LIS, DATA, R14), // AE : DATA <= IOPPORTNUM             : INS  14 : Input port 14
    MM(0x1B, L, 0, I0, OP_MOV, RACC, DATA), //      DB <= DATA ioport
    MM(0x00, S, 1, I0, OP_NOP, RACC, RACC), ZZ, ZZ, ZZ, ZZ, ZZ,
    MM(0x1C, L, 0, I0, OP_LIS, DATA, R15), // AF : DATA <= IOPPORTNUM             : INS  15 : Input port 15
    MM(0x1B, L, 0, I0, OP_MOV, RACC, DATA), //      DB <= DATA ioport
    MM(0x00, S, 1, I0, OP_NOP, RACC, RACC), ZZ, ZZ, ZZ, ZZ, ZZ,

    MM(0x1C, S, 0, I0, OP_MOV, PORT0, RACC), // B0 : IOPORT[0] <= ACC               : OUTS 0  : Output port 0
    MM(0x00, S, 0, I0, OP_NOP, RACC, RACC), ZZ, ZZ, ZZ, ZZ, ZZ, ZZ,
    MM(0x1C, S, 0, I0, OP_MOV, PORT1, RACC), // B1 : IOPORT[1] <= ACC               : OUTS 1  : Output port 1
    MM(0x00, S, 0, I0, OP_NOP, RACC, RACC), ZZ, ZZ, ZZ, ZZ, ZZ, ZZ,
    MM(0x1C, L, 0, I0, OP_LIS, DATA, R2), // B2 : DATA <= IOPPORTNUM             : OUTS 2  : Output port 2
    MM(0x1A, L, 0, I0, OP_MOV, DATA, RACC), //      DATA ioport <= DB
    MM(0x00, S, 1, IX, OP_NOP, RACC, RACC), ZZ, ZZ, ZZ, ZZ, ZZ,
    MM(0x1C, L, 0, I0, OP_LIS, DATA, R3), // B3 : DATA <= IOPPORTNUM             : OUTS 3  : Output port 3
    MM(0x1A, L, 0, I0, OP_MOV, DATA, RACC), //      DATA ioport <= DB
    MM(0x00, S, 1, IX, OP_NOP, RACC, RACC), ZZ, ZZ, ZZ, ZZ, ZZ,
    MM(0x1C, L, 0, I0, OP_LIS, DATA, R4), // B4 : DATA <= IOPPORTNUM             : OUTS 4  : Output port 4
    MM(0x1A, L, 0, I0, OP_MOV, DATA, RACC), //      DATA ioport <= DB
    MM(0x00, S, 1, IX, OP_NOP, RACC, RACC), ZZ, ZZ, ZZ, ZZ, ZZ,
    MM(0x1C, L, 0, I0, OP_LIS, DATA, R5), // B5 : DATA <= IOPPORTNUM             : OUTS 5  : Output port 5
    MM(0x1A, L, 0, I0, OP_MOV, DATA, RACC), //      DATA ioport <= DB
    MM(0x00, S, 1, IX, OP_NOP, RACC, RACC), ZZ, ZZ, ZZ, ZZ, ZZ,
    MM(0x1C, L, 0, I0, OP_LIS, DATA, R6), // B6 : DATA <= IOPPORTNUM             : OUTS 6  : Output port 6
    MM(0x1A, L, 0, I0, OP_MOV, DATA, RACC), //      DATA ioport <= DB
    MM(0x00, S, 1, IX, OP_NOP, RACC, RACC), ZZ, ZZ, ZZ, ZZ, ZZ,
    MM(0x1C, L, 0, I0, OP_LIS, DATA, R7), // B7 : DATA <= IOPPORTNUM             : OUTS 7  : Output port 7
    MM(0x1A, L, 0, I0, OP_MOV, DATA, RACC), //      DATA ioport <= DB
    MM(0x00, S, 1, IX, OP_NOP, RACC, RACC), ZZ, ZZ, ZZ, ZZ, ZZ,
    MM(0x1C, L, 0, I0, OP_LIS, DATA, R8), // B8 : DATA <= IOPPORTNUM             : OUTS 8  : Output port 8
    MM(0x1A, L, 0, I0, OP_MOV, DATA, RACC), //      DATA ioport <= DB
    MM(0x00, S, 1, IX, OP_NOP, RACC, RACC), ZZ, ZZ, ZZ, ZZ, ZZ,
    MM(0x1C, L, 0, I0, OP_LIS, DATA, R9), // B9 : DATA <= IOPPORTNUM             : OUTS 9  : Output port 9
    MM(0x1A, L, 0, I0, OP_MOV, DATA, RACC), //      DATA ioport <= DB
    MM(0x00, S, 1, IX, OP_NOP, RACC, RACC), ZZ, ZZ, ZZ, ZZ, ZZ,
    MM(0x1C, L, 0, I0, OP_LIS, DATA, R10), // BA : DATA <= IOPPORTNUM             : OUTS 10 : Output port 10
    MM(0x1A, L, 0, I0, OP_MOV, DATA, RACC), //      DATA ioport <= DB
    MM(0x00, S, 1, IX, OP_NOP, RACC, RACC), ZZ, ZZ, ZZ, ZZ, ZZ,
    MM(0x1C, L, 0, I0, OP_LIS, DATA, R11), // BB : DATA <= IOPPORTNUM             : OUTS 11 : Output port 11
    MM(0x1A, L, 0, I0, OP_MOV, DATA, RACC), //      DATA ioport <= DB
    MM(0x00, S, 1, IX, OP_NOP, RACC, RACC), ZZ, ZZ, ZZ, ZZ, ZZ,
    MM(0x1C, L, 0, I0, OP_LIS, DATA, R12), // BC : DATA <= IOPPORTNUM             : OUTS 12 : Output port 12
    MM(0x1A, L, 0, I0, OP_MOV, DATA, RACC), //      DATA ioport <= DB
    MM(0x00, S, 1, IX, OP_NOP, RACC, RACC), ZZ, ZZ, ZZ, ZZ, ZZ,
    MM(0x1C, L, 0, I0, OP_LIS, DATA, R13), // BD : DATA <= IOPPORTNUM             : OUTS 13 : Output port 13
    MM(0x1A, L, 0, I0, OP_MOV, DATA, RACC), //      DATA ioport <= DB
    MM(0x00, S, 1, IX, OP_NOP, RACC, RACC), ZZ, ZZ, ZZ, ZZ, ZZ,
    MM(0x1C, L, 0, I0, OP_LIS, DATA, R14), // BE : DATA <= IOPPORTNUM             : OUTS 14 : Output port 14
    MM(0x1A, L, 0, I0, OP_MOV, DATA, RACC), //      DATA ioport <= DB
    MM(0x00, S, 1, IX, OP_NOP, RACC, RACC), ZZ, ZZ, ZZ, ZZ, ZZ,
    MM(0x1C, L, 0, I0, OP_LIS, DATA, R15), // BF : DATA <= IOPPORTNUM             : OUTS 15 : Output port 15
    MM(0x1A, L, 0, I0, OP_MOV, DATA, RACC), //      DATA ioport <= DB
    MM(0x00, S, 1, IX, OP_NOP, RACC, RACC), ZZ, ZZ, ZZ, ZZ, ZZ,

    MM(0x00, S, 1, I0, OP_ADD, RACC, R0), ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, // C0 : ACC <= ACC + R0                : AS R0    : ADD binary R0
    MM(0x00, S, 1, I0, OP_ADD, RACC, R1), ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, // C1 : ACC <= ACC + R1                : AS R1    : ADD binary R1
    MM(0x00, S, 1, I0, OP_ADD, RACC, R2), ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, // C2 : ACC <= ACC + R2                : AS R2    : ADD binary R2
    MM(0x00, S, 1, I0, OP_ADD, RACC, R3), ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, // C3 : ACC <= ACC + R3                : AS R3    : ADD binary R3
    MM(0x00, S, 1, I0, OP_ADD, RACC, R4), ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, // C4 : ACC <= ACC + R4                : AS R4    : ADD binary R4
    MM(0x00, S, 1, I0, OP_ADD, RACC, R5), ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, // C5 : ACC <= ACC + R5                : AS R5    : ADD binary R5
    MM(0x00, S, 1, I0, OP_ADD, RACC, R6), ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, // C6 : ACC <= ACC + R6                : AS R6    : ADD binary R6
    MM(0x00, S, 1, I0, OP_ADD, RACC, R7), ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, // C7 : ACC <= ACC + R7                : AS R7    : ADD binary R7
    MM(0x00, S, 1, I0, OP_ADD, RACC, R8), ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, // C8 : ACC <= ACC + R8                : AS R8    : ADD binary R8
    MM(0x00, S, 1, I0, OP_ADD, RACC, R9), ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, // C9 : ACC <= ACC + R9                : AS R9    : ADD binary R9
    MM(0x00, S, 1, I0, OP_ADD, RACC, R10), ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, // CA : ACC <= ACC + R10               : AS R10   : ADD binary R10
    MM(0x00, S, 1, I0, OP_ADD, RACC, R11), ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, // CB : ACC <= ACC + R11               : AS R11   : ADD binary R11
    MM(0x00, S, 1, I0, OP_ADD, RACC, RISAR), ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, // CC : ACC <= ACC + (ISAR)            : AS R12   : ADD binary (ISAR)
    MM(0x00, S, 1, I0, OP_ADD, RACC, RISARP), ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, // CD : ACC <= ACC + (ISAR++)          : AS R13   : ADD binary (ISAR++)
    MM(0x00, S, 1, I0, OP_ADD, RACC, RISARM), ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, // CE : ACC <= ACC + (ISAR//)          : AS R14   : ADD binary (ISAR//)
    MM(0x00, S, 1, I0, OP_ADD, RACC, R15), ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, // CF : ACC <= ACC + R15 <INVALIDE>    : AS R15   : Invalid

    MM(0x1C, S, 0, I0, OP_NOP, RACC, RACC), // D0 : ACC <= ACC + R0                : ASD R0   : ADD decimal R0
    MM(0x00, S, 1, I0, OP_ADDD, RACC, R0), ZZ, ZZ, ZZ, ZZ, ZZ, ZZ,
    MM(0x1C, S, 0, I0, OP_NOP, RACC, RACC), // D1 : ACC <= ACC + R1                : ASD R1   : ADD decimal R1
    MM(0x00, S, 1, I0, OP_ADDD, RACC, R1), ZZ, ZZ, ZZ, ZZ, ZZ, ZZ,
    MM(0x1C, S, 0, I0, OP_NOP, RACC, RACC), // D2 : ACC <= ACC + R2                : ASD R2   : ADD decimal R2
    MM(0x00, S, 1, I0, OP_ADDD, RACC, R2), ZZ, ZZ, ZZ, ZZ, ZZ, ZZ,
    MM(0x1C, S, 0, I0, OP_NOP, RACC, RACC), // D3 : ACC <= ACC + R3                : ASD R3   : ADD decimal R3
    MM(0x00, S, 1, I0, OP_ADDD, RACC, R3), ZZ, ZZ, ZZ, ZZ, ZZ, ZZ,
    MM(0x1C, S, 0, I0, OP_NOP, RACC, RACC), // D4 : ACC <= ACC + R4                : ASD R4   : ADD decimal R4
    MM(0x00, S, 1, I0, OP_ADDD, RACC, R4), ZZ, ZZ, ZZ, ZZ, ZZ, ZZ,
    MM(0x1C, S, 0, I0, OP_NOP, RACC, RACC), // D5 : ACC <= ACC + R5                : ASD R5   : ADD decimal R5
    MM(0x00, S, 1, I0, OP_ADDD, RACC, R5), ZZ, ZZ, ZZ, ZZ, ZZ, ZZ,
    MM(0x1C, S, 0, I0, OP_NOP, RACC, RACC), // D6 : ACC <= ACC + R6                : ASD R6   : ADD decimal R6
    MM(0x00, S, 1, I0, OP_ADDD, RACC, R6), ZZ, ZZ, ZZ, ZZ, ZZ, ZZ,
    MM(0x1C, S, 0, I0, OP_NOP, RACC, RACC), // D7 : ACC <= ACC + R7                : ASD R7   : ADD decimal R7
    MM(0x00, S, 1, I0, OP_ADDD, RACC, R7), ZZ, ZZ, ZZ, ZZ, ZZ, ZZ,
    MM(0x1C, S, 0, I0, OP_NOP, RACC, RACC), // D8 : ACC <= ACC + R8                : ASD R8   : ADD decimal R8
    MM(0x00, S, 1, I0, OP_ADDD, RACC, R8), ZZ, ZZ, ZZ, ZZ, ZZ, ZZ,
    MM(0x1C, S, 0, I0, OP_NOP, RACC, RACC), // D9 : ACC <= ACC + R9                : ASD R9   : ADD decimal R9
    MM(0x00, S, 1, I0, OP_ADDD, RACC, R9), ZZ, ZZ, ZZ, ZZ, ZZ, ZZ,
    MM(0x1C, S, 0, I0, OP_NOP, RACC, RACC), // DA : ACC <= ACC + R10               : ASD R10  : ADD decimal R10
    MM(0x00, S, 1, I0, OP_ADDD, RACC, R10), ZZ, ZZ, ZZ, ZZ, ZZ, ZZ,
    MM(0x1C, S, 0, I0, OP_NOP, RACC, RACC), // DB : ACC <= ACC + R11               : ASD R11  : ADD decimal R11
    MM(0x00, S, 1, I0, OP_ADDD, RACC, R11), ZZ, ZZ, ZZ, ZZ, ZZ, ZZ,
    MM(0x1C, S, 0, I0, OP_NOP, RACC, RACC), // DC : ACC <= ACC + (ISAR)            : ASD R12  : ADD decimal (ISAR)
    MM(0x00, S, 1, I0, OP_ADDD, RACC, RISAR), ZZ, ZZ, ZZ, ZZ, ZZ, ZZ,
    MM(0x1C, S, 0, I0, OP_NOP, RACC, RACC), // DD : ACC <= ACC + (ISAR++)          : ASD R13  : ADD decimal (ISAR++)
    MM(0x00, S, 1, I0, OP_ADDD, RACC, RISARP), ZZ, ZZ, ZZ, ZZ, ZZ, ZZ,
    MM(0x1C, S, 0, I0, OP_NOP, RACC, RACC), // DE : ACC <= ACC + (ISAR//)          : ASD R14  : ADD decimal (ISAR//)
    MM(0x00, S, 1, I0, OP_ADDD, RACC, RISARM), ZZ, ZZ, ZZ, ZZ, ZZ, ZZ,
    MM(0x1C, S, 0, I0, OP_NOP, RACC, RACC), // DF : ACC <= ACC + R15 <INVALIDE>    : ASD R15  : Invalid
    MM(0x00, S, 1, I0, OP_ADDD, RACC, R15), ZZ, ZZ, ZZ, ZZ, ZZ, ZZ,

    MM(0x00, S, 1, I0, OP_XOR, RACC, R0), ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, // E0 : ACC <= ACC XOR R0              : XS R0    : XOR R0
    MM(0x00, S, 1, I0, OP_XOR, RACC, R1), ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, // E1 : ACC <= ACC XOR R1              : XS R1    : XOR R1
    MM(0x00, S, 1, I0, OP_XOR, RACC, R2), ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, // E2 : ACC <= ACC XOR R2              : XS R2    : XOR R2
    MM(0x00, S, 1, I0, OP_XOR, RACC, R3), ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, // E3 : ACC <= ACC XOR R3              : XS R3    : XOR R3
    MM(0x00, S, 1, I0, OP_XOR, RACC, R4), ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, // E4 : ACC <= ACC XOR R4              : XS R4    : XOR R4
    MM(0x00, S, 1, I0, OP_XOR, RACC, R5), ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, // E5 : ACC <= ACC XOR R5              : XS R5    : XOR R5
    MM(0x00, S, 1, I0, OP_XOR, RACC, R6), ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, // E6 : ACC <= ACC XOR R6              : XS R6    : XOR R6
    MM(0x00, S, 1, I0, OP_XOR, RACC, R7), ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, // E7 : ACC <= ACC XOR R7              : XS R7    : XOR R7
    MM(0x00, S, 1, I0, OP_XOR, RACC, R8), ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, // E8 : ACC <= ACC XOR R8              : XS R8    : XOR R8
    MM(0x00, S, 1, I0, OP_XOR, RACC, R9), ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, // E9 : ACC <= ACC XOR R9              : XS R9    : XOR R9
    MM(0x00, S, 1, I0, OP_XOR, RACC, R10), ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, // EA : ACC <= ACC XOR R10             : XS R10   : XOR R10
    MM(0x00, S, 1, I0, OP_XOR, RACC, R11), ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, // EB : ACC <= ACC XOR R11             : XS R11   : XOR R11
    MM(0x00, S, 1, I0, OP_XOR, RACC, RISAR), ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, // EC : ACC <= ACC XOR (ISAR)          : XS R12   : XOR (ISAR)
    MM(0x00, S, 1, I0, OP_XOR, RACC, RISARP), ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, // ED : ACC <= ACC XOR (ISAR++)        : XS R13   : XOR (ISAR++)
    MM(0x00, S, 1, I0, OP_XOR, RACC, RISARM), ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, // EE : ACC <= ACC XOR (ISAR//)        : XS R14   : XOR (ISAR//)
    MM(0x00, S, 1, I0, OP_XOR, RACC, R15), ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, // EF : ACC <= ACC XOR R15  <INVALIDE> : XS R15   : Invalid

    MM(0x00, S, 1, I0, OP_AND, RACC, R0), ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, // F0 : ACC <= ACC AND R0              : NS R0    : AND R0
    MM(0x00, S, 1, I0, OP_AND, RACC, R1), ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, // F1 : ACC <= ACC AND R1              : NS R1    : AND R1
    MM(0x00, S, 1, I0, OP_AND, RACC, R2), ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, // F2 : ACC <= ACC AND R2              : NS R2    : AND R2
    MM(0x00, S, 1, I0, OP_AND, RACC, R3), ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, // F3 : ACC <= ACC AND R3              : NS R3    : AND R3
    MM(0x00, S, 1, I0, OP_AND, RACC, R4), ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, // F4 : ACC <= ACC AND R4              : NS R4    : AND R4
    MM(0x00, S, 1, I0, OP_AND, RACC, R5), ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, // F5 : ACC <= ACC AND R5              : NS R5    : AND R5
    MM(0x00, S, 1, I0, OP_AND, RACC, R6), ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, // F6 : ACC <= ACC AND R6              : NS R6    : AND R6
    MM(0x00, S, 1, I0, OP_AND, RACC, R7), ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, // F7 : ACC <= ACC AND R7              : NS R7    : AND R7
    MM(0x00, S, 1, I0, OP_AND, RACC, R8), ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, // F8 : ACC <= ACC AND R8              : NS R8    : AND R8
    MM(0x00, S, 1, I0, OP_AND, RACC, R9), ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, // F9 : ACC <= ACC AND R9              : NS R9    : AND R9
    MM(0x00, S, 1, I0, OP_AND, RACC, R10), ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, // FA : ACC <= ACC AND R10             : NS R10   : AND R10
    MM(0x00, S, 1, I0, OP_AND, RACC, R11), ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, // FB : ACC <= ACC AND R11             : NS R11   : AND R11
    MM(0x00, S, 1, I0, OP_AND, RACC, RISAR), ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, // FC : ACC <= ACC AND (ISAR)          : NS R12   : AND (ISAR)
    MM(0x00, S, 1, I0, OP_AND, RACC, RISARP), ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, // FD : ACC <= ACC AND (ISAR++)        : NS R13   : AND (ISAR++)
    MM(0x00, S, 1, I0, OP_AND, RACC, RISARM), ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, // FE : ACC <= ACC AND (ISAR//)        : NS R14   : AND (ISAR//)
    MM(0x00, S, 1, I0, OP_AND, RACC, R15), ZZ, ZZ, ZZ, ZZ, ZZ, ZZ, ZZ // FF : ACC <= ACC AND R15 <INVALIDE>  : NS R15   : Invalid
  )

  val ILEN = Array(
    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, //00
    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, //10
    2, 2, 2, 2, 2, 2, 2, 2, 3, 3, 3, 1, 1, 1, 0, 0, //20
    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, //30
    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, //40
    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, //50
    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, //60
    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, //70
    2, 2, 2, 2, 2, 2, 2, 2, 1, 1, 1, 1, 1, 1, 1, 2, //80
    2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, //90
    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, //A0
    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, //B0
    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, //C0
    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, //D0
    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, //E0
    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0) //F0

  val OPTXT = Array(
    "LR A,KU     ", "LR A,KL     ", "LR A,QU     ", "LR A,QL     ", // 00
    "LR KU,A     ", "LR KL,A     ", "LR QU,A     ", "LR QL,A     ",
    "LR K,P      ", "LR P,K      ", "LR A,IS     ", "LR IS,A     ",
    "PK          ", "LR          ", "LR Q,DC     ", "LR DC,Q     ",
    "LR DC,H     ", "LR H,DC     ", "SR   1      ", "SL   1      ", // 10
    "SR   4      ", "SL   4      ", "LM          ", "ST          ",
    "COM         ", "LNK         ", "DI          ", "EI          ",
    "POP         ", "LR W,J      ", "LR J,W      ", "INC         ",
    "LI   ii     ", "NI   ii     ", "OI   ii     ", "XI   ii     ", // 20
    "AI   ii     ", "CI   ii     ", "IN   aa     ", "OUT  aa     ",
    "PI  aaaa    ", "JMP aaaa    ", "DCI aaaa    ", "NOP         ",
    "XDC         ", "NOP         ", "<INTERRUPT> ", "<RESET>     ",
    "DEC  R0     ", "DEC  R1     ", "DEC  R2     ", "DEC  R3     ", // 30
    "DEC  R4     ", "DEC  R5     ", "DEC  R6     ", "DEC  R7     ",
    "DEC  R8     ", "DEC  R9     ", "DEC  R10    ", "DEC  R11    ",
    "DEC (ISAR)  ", "DEC  (ISAR+)", "DEC  (ISAR-)", "Invalid     ",
    "LR A,R0     ", "LR A,R1     ", "LR A,R2     ", "LR A,R3     ", // 40
    "LR A,R4     ", "LR A,R5     ", "LR A,R6     ", "LR A,R7     ",
    "LR A,R8     ", "LR A,R9     ", "LR A,R10    ", "LR A,R11    ",
    "LR A,(ISAR) ", "LR A,(ISAR+)", "LR A,(ISAR-)", "Invalid     ",
    "LR R0 ,A    ", "LR R1 ,A    ", "LR R2 ,A    ", "LR R3 ,A    ", // 50
    "LR R4 ,A    ", "LR R5 ,A    ", "LR R6 ,A    ", "LR R7 ,A    ",
    "LR R8 ,A    ", "LR R9 ,A    ", "LR R10,A    ", "LR R11,A    ",
    "LR (ISAR),A ", "LR (ISAR+),A", "LR (ISAR-),A", "Invalid     ",
    "LISU 0      ", "LISU 1      ", "LISU 2      ", "LISU 3      ", // 60
    "LISU 4      ", "LISU 5      ", "LISU 6      ", "LISU 7      ",
    "LISL 0      ", "LISL 1      ", "LISL 2      ", "LISL 3      ",
    "LISL 4      ", "LISL 5      ", "LISL 6      ", "LISL 7      ",
    "LIS 0       ", "LIS 1       ", "LIS 2       ", "LIS 3       ", // 70
    "LIS 4       ", "LIS 5       ", "LIS 6       ", "LIS 7       ",
    "LIS 8       ", "LIS 9       ", "LIS 10      ", "LIS 11      ",
    "LIS 12      ", "LIS 13      ", "LIS 14      ", "LIS 15      ",
    "BT   0 aa   ", "BT   1 aa   ", "BT   2 aa   ", "BT   3 aa   ", // 80
    "BT   4 aa   ", "BT   5 aa   ", "BT   6 aa   ", "BT   7 aa   ",
    "AM          ", "AMD         ", "NM          ", "OM          ",
    "XM          ", "CM          ", "ADC         ", "BR7 aa      ",
    "BF 0   aa   ", "BF 1   aa   ", "BF 2   aa   ", "BF 3   aa   ", // 90
    "BF 4   aa   ", "BF 5   aa   ", "BF 6   aa   ", "BF 7   aa   ",
    "BF 8   aa   ", "BF 9   aa   ", "BF A   aa   ", "BF B   aa   ",
    "BF C   aa   ", "BF D   aa   ", "BF E   aa   ", "BF F   aa   ",
    "INS  0      ", "INS  1      ", "INS  2      ", "INS  3      ", // A0
    "INS  4      ", "INS  5      ", "INS  6      ", "INS  7      ",
    "INS  8      ", "INS  9      ", "INS  10     ", "INS  11     ",
    "INS  12     ", "INS  13     ", "INS  14     ", "INS  15     ",
    "OUTS 0      ", "OUTS 1      ", "OUTS 2      ", "OUTS 3      ", // B0
    "OUTS 4      ", "OUTS 5      ", "OUTS 6      ", "OUTS 7      ",
    "OUTS 8      ", "OUTS 9      ", "OUTS 10     ", "OUTS 11     ",
    "OUTS 12     ", "OUTS 13     ", "OUTS 14     ", "OUTS 15     ",
    "AS R0       ", "AS R1       ", "AS R2       ", "AS R3       ", // C0
    "AS R4       ", "AS R5       ", "AS R6       ", "AS R7       ",
    "AS R8       ", "AS R9       ", "AS R10      ", "AS R11      ",
    "AS  (ISAR)  ", "AS  (ISAR+) ", "AS  (ISAR-) ", "Invalid     ",
    "ASD R0      ", "ASD R1      ", "ASD R2      ", "ASD R3      ", // D0
    "ASD R4      ", "ASD R5      ", "ASD R6      ", "ASD R7      ",
    "ASD R8      ", "ASD R9      ", "ASD R10     ", "ASD R11     ",
    "ASD (ISAR)  ", "ASD (ISAR+) ", "ASD (ISAR-) ", "Invalid     ",
    "XOR R0      ", "XOR R1      ", "XOR R2      ", "XOR R3      ", // E0
    "XOR R4      ", "XOR R5      ", "XOR R6      ", "XOR R7      ",
    "XOR R8      ", "XOR R9      ", "XOR R10     ", "XOR R11     ",
    "XOR (ISAR)  ", "XOR (ISAR+) ", "XOR (ISAR-) ", "Invalid     ",
    "AND R0      ", "AND R1      ", "AND R2      ", "AND R3      ", // F0
    "AND R4      ", "AND R5      ", "AND R6      ", "AND R7      ",
    "AND R8      ", "AND R9      ", "AND R10     ", "AND R11     ",
    "AND (ISAR)  ", "AND (ISAR+) ", "AND (ISAR-) ", "Invalid     ")
}

class aluop extends Component {
  val io = new Bundle {
    val op = in(EnumOp) // ALU operation
    val code = in(UInt (8 bits)) // OPCODE
    val src1 = in(UInt (8 bits)) // Source Reg 1 / Destination reg
    val src2 = in(UInt (8 bits)) // Source Reg 2
    val iozcs_i = in(UInt (5 bits)) // Flags before
    val dst = out(UInt (8 bits)) // Result
    val dstm = out(Bool) // Modified result reg
    val iozcs_o = out(UInt (5 bits)) // Flags after
    val test = out(Bool) // Conditional branch test result
  }

  def BF(op: UInt, iozcs: UInt): Bool = {
    val v = Bool
    v := op.mux(
      0  -> True, // Unconditional Branch
      1  -> (!iozcs(0)), // Branch on negative
      2  -> (!iozcs(1)), // Branch if no carry
      3  -> (!iozcs(1) && !iozcs(0)), // Branch if no carry & negative
      4  -> (!iozcs(2)), // Branch if not zero
      5  -> (!iozcs(0)), // Same as T=1
      6  -> (!iozcs(1) && !iozcs(2)), // Branch if no carry & no zero
      7  -> (!iozcs(1) && !iozcs(0)), // Same as T=3
      8  -> (!iozcs(3)), // Branch if no overflow
      9  -> (!iozcs(3) && !iozcs(0)), // Branch if negative & no overflow
      10 -> (!iozcs(3) && !iozcs(1)), // Branch if no overflow and no carry
      11 -> (!iozcs(3) && !iozcs(1) && !iozcs(0)), // Branch if no overflow, no carry and negative
      12 -> (!iozcs(3) && !iozcs(2)), // Branch if no overflow and no zero
      13 -> (!iozcs(3) && !iozcs(0)), // Same as T=9
      14 -> (!iozcs(3) && !iozcs(1) && !iozcs(0)), // Branch if no overflow no carry and not zero
      default -> (!iozcs(3) && !iozcs(1) && !iozcs(0)) // Same as T=B
    )
    v
  }

  def BT(op: UInt, iozcs: UInt): Bool = {
    val v = Bool
    v := op.mux(
      0 -> False, // No branch
      1 -> (iozcs(0)), // Branch if positive
      2 -> (iozcs(1)), // Branch if carry
      3 -> (iozcs(0) || iozcs(1)), // Branch if positive or carry
      4 -> (iozcs(2)), // Branch if zero
      5 -> (iozcs(0)), // Same as T=1
      6 -> (iozcs(2) || iozcs(1)), // Branch if zero or carry
      default -> (iozcs(0) || iozcs(1)) // Same as T=3
    )
    v
  }

  var dst_v = UInt (8 bits)
  var dst9_v = UInt (9 bits)
  var tc_v,tic_v = Bool
  tc_v := False
  tic_v := False
  dst9_v := 0
  dst_v := 0

  io.iozcs_o:=io.iozcs_i
  io.dstm:=False
  io.test:=False
  import EnumOp._

  switch (io.op) {
    is (OP_ADD) {
      dst9_v \= (U"0" @@ io.src1) + U"0" @@ io.src2
      io.iozcs_o(0) := !dst9_v(7)
      io.iozcs_o(1) := dst9_v(8)
      io.iozcs_o(2) := (dst9_v(7 downto 0) === 0)
      io.iozcs_o(3) := (io.src1 (7) ^ dst9_v (7) ) & (io.src2 (7) ^ dst9_v (7) )
      io.dstm := True
      dst_v \= dst9_v (7 downto 0)
    }
    is (OP_ADDD) { // Decimal Add
      dst9_v  \= (U"0" @@ io.src1) + (U"0" @@ io.src2)
      io.iozcs_o (0) := !dst9_v(7)
      io.iozcs_o (1) := dst9_v(8)
      io.iozcs_o (2) := (dst9_v(7 downto 0) === 0)
      io.iozcs_o (3) := (io.src1 (7) ^ dst9_v (7) ) & (io.src2 (7) ^ dst9_v (7) )

      tc_v \= ((((U"0" @@ io.src1) + (U"0" @@ io.src2) ) @@ U"111110000") > U"011110000")
      tic_v \= ((U"0" @@ io.src1 (3 downto 0) ) + (U"0" @@ io.src2 (3 downto 0) ) > U"01111")

      dst_v \= io.src1 + io.src2
      when (!tc_v && !tic_v) {
        dst_v \= ((dst_v + U"8'hA0") & U"8'hF0") + ((dst_v + U"8'h0A") & U"8'h0F")
      } elsewhen (!tc_v && tic_v) {
        dst_v \= ((dst_v + U"8'hA0") & U"8'hF0") + (dst_v & U"8'h0F")
      } elsewhen (tc_v && !tic_v) {
        dst_v \= (dst_v & U"8'hF0") + ((dst_v + U"8'h0A") & U"8'h0F")
      }
      io.dstm := True
    }
    is (OP_CMP) { // Compare
      dst9_v \= ((U"0" @@ ~io.src1) + (U"0" @@ io.src2) ) + 1
      io.iozcs_o (0) := !dst9_v(7)
      io.iozcs_o (1) := dst9_v (8)
      io.iozcs_o (2) := (dst9_v (7 downto 0) === 0)
      io.iozcs_o (3) := (!io.src1 (7) ^ dst9_v (7) ) & (io.src2 (7) ^ dst9_v (7) )
      io.dstm := False
    }
    is (OP_AND) { // &
      dst_v \= io.src1 & io.src2
      io.iozcs_o (0) := !dst_v(7)
      io.iozcs_o (1) := False
      io.iozcs_o (2) := (dst_v === 0)
      io.iozcs_o (3) := False
      io.dstm := True
    }
    is (OP_OR) { // OR
      dst_v \= io.src1 | io.src2
      io.iozcs_o (0) := !dst_v(7)
      io.iozcs_o (1) := False
      io.iozcs_o (2) := (dst_v === 0)
      io.iozcs_o (3) := False
      io.dstm := True
    }
    is (OP_XOR) { // ^
      dst_v \= io.src1 ^ io.src2
      io.iozcs_o (0) := !dst_v (7)
      io.iozcs_o (1) := False
      io.iozcs_o (2) := (dst_v === 0)
      io.iozcs_o (3) := False
      io.dstm := True
    }
    is (OP_DEC) { // DECREMENT : ADD FF
      dst9_v \= (U"0" @@ io.src1) + U"9'hFF"
      io.iozcs_o (0) := !dst9_v (7)
      io.iozcs_o (1) := dst9_v (8)
      io.iozcs_o (2) := (dst9_v (7 downto 0) === 0)
      io.iozcs_o (3) := (io.src1 (7) ^ dst9_v (7) ) & (!dst9_v (7) )
      io.dstm := True
      dst_v \= dst9_v (7 downto 0)
    }
    is (OP_SL1) { // SHIFT LEFT  1
      dst_v \= io.src1 (6 downto 0) @@ U"0"
      io.iozcs_o (0) := !dst_v(7)
      io.iozcs_o (1) := False
      io.iozcs_o (2) := (dst_v === 0)
      io.iozcs_o (3) := False
      io.dstm := True
    }
    is (OP_SL4) { // SHIFT LEFT  4
      dst_v \= io.src1 (3 downto 0) @@ U"0000"
      io.iozcs_o (0) := !dst_v (7)
      io.iozcs_o (1) := False
      io.iozcs_o (2) := (dst_v === 0)
      io.iozcs_o (3) := False
      io.dstm := True
    }
    is (OP_SR1) { // SHIFT RIGHT 1
      dst_v \= U"0" @@ io.src1 (7 downto 1)
      io.iozcs_o (0) := !dst_v (7)
      io.iozcs_o (1) := False
      io.iozcs_o (2) := (dst_v === 0)
      io.iozcs_o (3) := False
      io.dstm := True
    }
    is (OP_SR4) { //  SHIFT RIGHT 4
      dst_v \= U"0000" @@ io.src1 (7 downto 4)
      io.iozcs_o (0) := !dst_v(7)
      io.iozcs_o (1) := False
      io.iozcs_o (2) := (dst_v === 0)
      io.iozcs_o (3) := False
      io.dstm := True
    }
    is (OP_COM) { // COM. Complement
      dst_v \= ~io.src1
      io.iozcs_o (0) := !dst_v (7)
      io.iozcs_o (1) := False
      io.iozcs_o (2) := (dst_v === 0)
      io.iozcs_o (3) := False
      io.dstm := True
    }
    is (OP_LNK) { // LNK. Add carry to acc.
      dst9_v \= (U"0" @@ io.src1) + (U"0" @@ io.iozcs_i(1))
      io.iozcs_o (0) := !dst9_v (7)
      io.iozcs_o (1) := dst9_v (8)
      io.iozcs_o (2) := (dst9_v (7 downto 0) === 0)
      io.iozcs_o (3) := (io.src1 (7) ^ dst9_v (7) ) & dst9_v (7)
      io.dstm := True
      dst_v \= dst9_v(7 downto 0)
    }
    is (OP_INC) { // INC Increment
      dst9_v \= (U"0" @@ io.src1) + 1
      io.iozcs_o (0) := !dst9_v (7)
      io.iozcs_o (1) := dst9_v (8)
      io.iozcs_o (2) := (dst9_v (7 downto 0) === 0)
      io.iozcs_o (3) := (io.src1 (7) ^ dst9_v (7) ) && dst9_v (7)
      io.dstm := True
      dst_v \= dst9_v (7 downto 0)
    }
    is (OP_EDI) { //  Enable / Disable ICB
      io.iozcs_o (4) := io.code (0)
    }
    is (OP_LIS) { // Load immediate acc.
      dst_v \= U"0000" @@ io.code (3 downto 0)
      io.dstm := True
    }
    is (OP_TST8) { // 8x conditional branches
      io.test := BT(io.code (2 downto 0), io.iozcs_i)
    }
    is (OP_TST9) { // 9x conditional branches
      io.test := BF(io.code (3 downto 0), io.iozcs_i)
      io.dstm := False
    }
    is (OP_NOP) {
      io.dstm := False
    }
    is (OP_MOV) {
      dst_v \= io.src2
      io.dstm := True
    }
  }
  io.dst:=dst_v
}
