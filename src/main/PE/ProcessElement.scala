package PE

import Framework._
import spinal.core._
import spinal.sim._
import spinal.core.sim._

import scala.collection.mutable.ArrayBuffer

class ProcessElement() extends Component {
  val peClock = in Bool()
  val reset = in Bool()
  val icgClockDomain = ClockDomain(
    clock = peClock,
    reset = reset,
    config = ClockDomainConfig(
      clockEdge = RISING, resetKind = ASYNC, resetActiveLevel = LOW
    )
  )
  val database = new DataBase
  val plugins = new ArrayBuffer[Plugin]()
//  val icg = new IcgPlugin()
//  icg.createIcgClk(peClock, True, reset)
//  plugins += icg
  val interface = new InterfacePlugin(32, 64, 4)
  plugins += interface
  plugins += new FetchPlugin(icgClockDomain)
  plugins += new AssignPlugin(icgClockDomain)
  plugins += new DecodePlugin(icgClockDomain)
  plugins += new ExecutePlugin(icgClockDomain)
  plugins += new WriteBackPlugin(icgClockDomain)

  val framework = new Framework(plugins)
}

object ProcessElementVerilog extends App {
  Config.spinal.generateVerilog(new ProcessElement())
}