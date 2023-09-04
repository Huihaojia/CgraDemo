package PE

import Framework._
import spinal.core._
import spinal.core.sim._

trait WriteBackService extends Service {

}

class WriteBackPlugin(val icgClock: ClockDomain) extends Plugin with WriteBackService {
//  val icgClock = getService[IcgPlugin].getIcgClock()
  import Global._
  val setup = create early new ClockingArea(icgClock) {
    //WriteBack Stage
    val outputIndex = Reg(UInt(8 bits)) init (0) simPublic()
    val output = Reg(UInt(DATA_WIDTH bits)) init (0)
    val token = Reg(Bool()) init (False)

    val dataOut = UInt(DATA_WIDTH bits)
    val tokenOut = Bool()
    val outIndex = UInt(8 bits)
  }

  setup.setName(this.getName())

  val build = create late new ClockingArea(icgClock) {
    val creditIn = getService[InterfacePlugin].setup.creditIn
    val dataOut = getService[InterfacePlugin].setup.dataOut
    val tokenOut = getService[InterfacePlugin].setup.tokenOut
    /**
     * Generate Output
     */
    when(creditIn(setup.outputIndex)) {
      setup.dataOut := getService[ExecutePlugin].setup.output
      setup.tokenOut := getService[ExecutePlugin].setup.token
      setup.outIndex := getService[ExecutePlugin].setup.outputIndex
    } otherwise {
      setup.dataOut := setup.output
      setup.tokenOut := setup.token
      setup.outIndex := setup.outputIndex
    }

    switch(setup.outIndex) {
      for (i <- 0 until dataOut.length) {
        is(i) {
          dataOut(i) := setup.dataOut
          tokenOut(i) := setup.tokenOut
          for (j <- 0 until dataOut.length) {
            if (j != i) {
              dataOut(j) := 0
              tokenOut(j) := False
            }
          }
        }
      }
    }
  }
}
