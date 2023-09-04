package PEA

import spinal.core._
import spinal.core.sim._
import PE._

class ProcessElementArray(length: Int, width: Int) extends Component {
  val PEA = Array.fill(length)(Array.fill(width)(new ProcessElement()))

  val io = new Bundle {
    val clock = in Bool()
    val reset = in Bool()
    val start = in Bool()
    val writeEnable = in Bool()
    val writeConfig = in Vec(Bits(16 bits), 4)
    val tokenIn = in Vec(Bool(), 8)
    val creditIn = in Vec(Bool(), 8)
    val dataIn = in Vec(UInt(8 bits), 8)
  }

  val peaClock = ClockDomain(
    clock = io.clock,
    reset = io.reset,
    config = ClockDomainConfig(
      clockEdge = RISING, resetKind = ASYNC, resetActiveLevel = LOW
    )
  )

  for(i <- 0 until width) {
    for(j <- 0 until length) {
      PEA(i)(j).peClock := io.clock
      PEA(i)(j).reset := io.reset
      PEA(i)(j).interface.setup.peStart := io.start
      PEA(i)(j).interface.setup.writeEnable := io.writeEnable
      PEA(i)(j).interface.setup.writeConfig := io.writeConfig(i*2+j)
    }
  }

  for (j <- 0 until width) {
    for (i <- 0 until length) {
      (j, i) match {
        case (0, 0) =>
          this.connectPe(PEA(j)(i), "DOWN", PEA(j+1)(i))
          this.connectPe(PEA(j)(i), "RIGHT", PEA(j)(i+1))
          this.connectPea(PEA(j)(i), "UP", 0)
          this.connectPea(PEA(j)(i), "LEFT", 7)
        case (0, 1) =>
          this.connectPe(PEA(j)(i), "DOWN", PEA(j + 1)(i))
          this.connectPe(PEA(j)(i), "LEFT", PEA(j)(i - 1))
          this.connectPea(PEA(j)(i), "UP", 1)
          this.connectPea(PEA(j)(i), "RIGHT", 2)
        case (1, 0) =>
          this.connectPe(PEA(j)(i), "UP", PEA(j - 1)(i))
          this.connectPe(PEA(j)(i), "RIGHT", PEA(j)(i + 1))
          this.connectPea(PEA(j)(i), "DOWN", 3)
          this.connectPea(PEA(j)(i), "LEFT", 4)
        case (1, 1) =>
          this.connectPe(PEA(j)(i), "UP", PEA(j - 1)(i))
          this.connectPe(PEA(j)(i), "LEFT", PEA(j)(i - 1))
          this.connectPea(PEA(j)(i), "DOWN", 5)
          this.connectPea(PEA(j)(i), "RIGHT", 6)
        case (_, _) =>
      }
    }
  }

  def connectPe(src: ProcessElement, dir: String, dst: ProcessElement): Unit = {
    dir match {
      case "DOWN" =>
        src.interface.setup.dataIn(2) := dst.interface.setup.dataOut(0)
        src.interface.setup.tokenIn(2) := dst.interface.setup.tokenOut(0)
        src.interface.setup.creditIn(2) := dst.interface.setup.creditOut(0)
      case "RIGHT" =>
        src.interface.setup.dataIn(1) := dst.interface.setup.dataOut(3)
        src.interface.setup.tokenIn(1) := dst.interface.setup.tokenOut(3)
        src.interface.setup.creditIn(1) := dst.interface.setup.creditOut(3)
      case "UP" =>
        src.interface.setup.dataIn(0) := dst.interface.setup.dataOut(2)
        src.interface.setup.tokenIn(0) := dst.interface.setup.tokenOut(2)
        src.interface.setup.creditIn(0) := dst.interface.setup.creditOut(2)
      case "LEFT" =>
        src.interface.setup.dataIn(3) := dst.interface.setup.dataOut(1)
        src.interface.setup.tokenIn(3) := dst.interface.setup.tokenOut(1)
        src.interface.setup.creditIn(3) := dst.interface.setup.creditOut(1)
      case _ => {}
    }
  }

  def connectPea(src: ProcessElement, dir: String, idx: Int): Unit = {
    dir match {
      case "UP" =>
        src.interface.setup.dataIn(0) := io.dataIn(idx)
        src.interface.setup.tokenIn(0) := io.tokenIn(idx)
        src.interface.setup.creditIn(0) := io.creditIn(idx)
      case "DOWN" =>
        src.interface.setup.dataIn(2) := io.dataIn(idx)
        src.interface.setup.tokenIn(2) := io.tokenIn(idx)
        src.interface.setup.creditIn(2) := io.creditIn(idx)
      case "LEFT" =>
        src.interface.setup.dataIn(3) := io.dataIn(idx)
        src.interface.setup.tokenIn(3) := io.tokenIn(idx)
        src.interface.setup.creditIn(3) := io.creditIn(idx)
      case "RIGHT" =>
        src.interface.setup.dataIn(1) := io.dataIn(idx)
        src.interface.setup.tokenIn(1) := io.tokenIn(idx)
        src.interface.setup.creditIn(1) := io.creditIn(idx)
      case _ => {}
    }
  }
}

object PeaVerilog extends App {
  Config.spinal.generateVerilog(new ProcessElementArray(2, 2))
}