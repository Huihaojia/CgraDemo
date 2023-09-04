package PE

import Framework._
import spinal.core._
import spinal.core.sim._

trait ExecuteService extends Service {

}

class ExecutePlugin(val icgClock: ClockDomain) extends Plugin with ExecuteService {
//  val icgClock = getService[IcgPlugin].getIcgClock()

  val setup = create early new ClockingArea(icgClock) {
    //Reg Decode Config
    import Global._
    val input1 = Reg(UInt(DATA_WIDTH.get bits)) init (0) simPublic()
    val input2 = Reg(UInt(DATA_WIDTH.get bits)) init (0) simPublic()
    val output = UInt(DATA_WIDTH.get bits) simPublic()
    val tokenReg = Reg(Bool()) init (False) simPublic()
    val token = Bool()

    //    val inputIndex1 = Reg(UInt(2 bits)) init (0) simPublic()
    //    val inputIndex2 = Reg(UInt(2 bits)) init (0) simPublic()

    val outputIndex = Reg(UInt(8 bits)) init (0) simPublic()
    val opcode = Reg(UInt(6 bits)) init (0) simPublic()

    //Execute Stage
    val credit = Reg(Bool()) init (True)
    val aluStall = opcode(1 to 3) =/= 0
  }

  setup.setName(this.getName())

  val build = create late new ClockingArea(icgClock) {
    setup.credit := getService[DecodePlugin].setup.credit

    setup.output := setup.input1 + setup.input2

    when(getService[DecodePlugin].setup.credit) {
      getService[WriteBackPlugin].setup.outputIndex := setup.outputIndex
      getService[WriteBackPlugin].setup.output := setup.output
      getService[WriteBackPlugin].setup.token := setup.token
    }

    when(setup.aluStall) {
      setup.opcode := setup.opcode - 1
      setup.token := False
    } otherwise {
      setup.token := setup.tokenReg
    }
  }
}
