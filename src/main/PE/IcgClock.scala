package PE

import Framework._
import spinal.core._

trait IcgService extends Service {
  def createIcgClk(clk: Bool, enable: Bool, rst: Bool): Unit
  def getIcgClock(): ClockDomain
  def getClock(): ClockDomain
}

class IcgPlugin extends Plugin with IcgService {
  assignID()
  printID()

  val icgClock = Bool()
  val clock = Bool()
  val reset = Bool()

  val clockDomain = ClockDomain(
    clock = clock,
    reset = reset,
    config = ClockDomainConfig(
      clockEdge = RISING, resetKind = ASYNC, resetActiveLevel = LOW
    )
  )

  val icgClockDomain = ClockDomain(
    clock = icgClock,
    reset = reset,
    config = ClockDomainConfig(
      clockEdge = RISING, resetKind = ASYNC, resetActiveLevel = LOW
    )
  )

  override def createIcgClk(clk: Bool, enable: Bool, rst: Bool): Unit = {
    icgClock := clk & enable
    clock := clk
    reset := rst
  }

  override def getIcgClock(): ClockDomain = icgClockDomain

  override def getClock(): ClockDomain = clockDomain
}