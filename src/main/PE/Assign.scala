package PE

import Framework._
import spinal.core._
import spinal.core.sim._

trait AssignService extends Service {

}

class AssignPlugin(val icgClock: ClockDomain) extends Plugin with AssignService {
//  val icgClock = getService[IcgPlugin].getIcgClock()
  val setup = create early new ClockingArea(icgClock) {
    import Global._
    val config = Reg(Bits(CONFIG_WIDTH bits)) init (0) simPublic()
//    val filling = Reg(Bool()) init(False)
  }

  setup.setName(this.getName())

  val build = create late new ClockingArea(icgClock) {
//    setup.filling := getService[FetchPlugin].setup.filling
    /**
     * Delay one Cycle
     */
    when(getService[DecodePlugin].setup.valid | getService[FetchPlugin].setup.filling) {
      getService[DecodePlugin].setup.config := setup.config
    }
  }
}
