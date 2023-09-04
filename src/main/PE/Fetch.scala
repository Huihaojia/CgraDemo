package PE

import Framework._
import spinal.core._
import spinal.core.sim._

import scala.collection.mutable.ArrayBuffer

trait FetchService extends Service {

}

class FetchPlugin(val icgClock: ClockDomain) extends Plugin with FetchService {
//  val icgClock = getService[IcgPlugin].getIcgClock()
  import Global._

  val setup = create early new ClockingArea(icgClock) {
    //Config Memory
    val configMem = Vec(Reg(Bits(CONFIG_WIDTH.get bits)) init (0), 8) simPublic()
    val configNum = Reg(UInt(CONFIG_ADDR.get bits)) init (0) simPublic()

    val pcReg = Reg(UInt(CONFIG_ADDR.get bits)) init (0) simPublic()
    val working = Reg(Bool()) init (False) simPublic()
    val filling = Reg(Bool()) init (False) simPublic()
    val finishing = Reg(Bool()) init (False) simPublic()
    val incFlag = Bool()
  }

  setup.setName(this.getName())

  val build = create late new ClockingArea(icgClock) {
    when(setup.configNum < 2) {
      setup.incFlag := setup.pcReg < setup.configNum
    } otherwise {
      setup.incFlag := setup.pcReg < 2
    }
    setup.filling := setup.incFlag

    /**
     * Write/Read Config
     * */
    val writeEnable = getService[InterfacePlugin].setup.writeEnable
    val writeConfig = getService[InterfacePlugin].setup.writeConfig
    val peStart = getService[InterfacePlugin].setup.peStart
    when(writeEnable) {
      setup.configMem(setup.pcReg) := writeConfig
      when(setup.pcReg =/= CONFIG_ADDR.get) {
        setup.pcReg := setup.pcReg + 1
      }
    } elsewhen (peStart | setup.finishing) {
      setup.pcReg := 0
    } elsewhen (setup.working) {
      when(setup.pcReg =/= setup.configNum) {
        when(getService[DecodePlugin].setup.valid | setup.filling) { //Reusable
          setup.pcReg := setup.pcReg + 1
        }
      }
    }

    /**
     * Prepare to Load Configurations
     */
    when(peStart) {
      setup.working := True
      setup.configNum := setup.pcReg - 1
    } elsewhen (setup.finishing) {
      setup.working := False
      setup.configNum := 0
    }

    /**
     * Read Configuration
     */
    when(setup.working) {
      when(getService[DecodePlugin].setup.valid | setup.filling) {
        getService[AssignPlugin].setup.config := setup.configMem(setup.pcReg)
      }
    } otherwise {
      getService[AssignPlugin].setup.config := 0
    }
  }
}
