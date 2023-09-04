package PE

import Framework._
import spinal.core._
import spinal.core.sim._

trait DecodeService extends Service {

}

class DecodePlugin(val icgClock: ClockDomain) extends Plugin with DecodeService {
//  val icgClock = getService[IcgPlugin].getIcgClock()

  val setup = create early new ClockingArea(icgClock) {
    //Decode Config
    import Global._
    val config = Reg(Bits(CONFIG_WIDTH.get bits)) init (0) simPublic()
    val inputIndex1 = config(13 to 14).asUInt simPublic()
    val inputIndex2 = config(10 to 11).asUInt simPublic()
    val outputIndex = config(8 to 9).asUInt simPublic()
    val opcode = config(4 to 7).asBits simPublic()
    val imm1 = config(15) simPublic()
    val imm2 = config(12) simPublic()
    val lock = config(3) simPublic()
    val lockCount = config(0 to 2) simPublic()

    val credit = Bool() simPublic()
    val token1 = Bool() simPublic()
    val token2 = Bool() simPublic()
    val token = token1 & token2 simPublic()
    val valid = Bool()
    /**
     * Select Input
     */
    val configValid = opcode.asUInt =/= 0 simPublic()
    val input1 = UInt(DATA_WIDTH.get bits) simPublic()
    val input2 = UInt(DATA_WIDTH.get bits) simPublic()

  }

  setup.setName(this.getName())

  val build = create late new ClockingArea(icgClock) {
    val dataIn = getService[InterfacePlugin].setup.dataIn
    val tokenIn = getService[InterfacePlugin].setup.tokenIn
    val creditIn = getService[InterfacePlugin].setup.creditIn
    val creditOut = getService[InterfacePlugin].setup.creditOut

    setup.valid := getService[ExecutePlugin].setup.credit & setup.token & ~getService[ExecutePlugin].setup.aluStall
    when(setup.configValid) {
      setup.credit := creditIn(setup.outputIndex)
      when(setup.imm1) {
        setup.input1 := setup.inputIndex1.resized
        setup.token1 := True
      } otherwise {
        setup.input1 := dataIn(setup.inputIndex1)
        setup.token1 := tokenIn(setup.inputIndex1)
      }
      when(setup.imm2) {
        setup.input2 := setup.inputIndex2.resized
        setup.token2 := True
      } otherwise {
        setup.input2 := dataIn(setup.inputIndex2)
        setup.token2 := tokenIn(setup.inputIndex2)
      }
    } otherwise {
      setup.input1 := 0
      setup.input2 := 0
      setup.token1 := False
      setup.token2 := False
      setup.credit := True
    }

    /**
     * Register Decode Configs
     */
    when(setup.valid) {
      getService[ExecutePlugin].setup.input1 := setup.input1
      getService[ExecutePlugin].setup.input2 := setup.input2
      getService[ExecutePlugin].setup.tokenReg := setup.token
      getService[ExecutePlugin].setup.outputIndex := setup.outputIndex
      getService[ExecutePlugin].setup.opcode := setup.opcode.asUInt
    }

    for (i <- 0 until creditOut.length) {
      val pathSelect = Reg(Bool()) init (False)
      pathSelect.setName(s"pathSelect$i")
      //      pathSelect := (((inputIndex1 === i) & token1 & ~imm1 | (inputIndex2 === i) & token2 & ~imm2)) & (token1 ^ token2)
      pathSelect := ((setup.inputIndex1 === i) & setup.token1 & ~setup.imm1) | ((setup.inputIndex2 === i) & setup.token2 & ~setup.imm2)
      creditOut(i) := ~pathSelect | (getService[ExecutePlugin].setup.credit & ~getService[ExecutePlugin].setup.aluStall)
    }
  }
}