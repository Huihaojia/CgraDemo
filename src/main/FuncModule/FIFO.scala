package FuncModule

import PE.Config
import spinal.core.sim._
import spinal.core._

class FIFO(dataWidth: Int, depth: Int) extends Component{
  val io = new Bundle {
    val clk = in Bool()
    val rst = in Bool()
    val writeEnable = in Bool()
    val writeData = in UInt(dataWidth bits)
    val insertEnable = in Bool()
    val insertAddr = in UInt(depth bits)
    val insertData = in UInt(dataWidth bits)
    val readEnable = in Bool()
    val readData = out UInt(dataWidth bits)
    val full = out Bool()
    val empty = out Bool()
  }

  val fifoClock = new ClockDomain(
    clock = io.clk,
    reset = io.rst,
    config = ClockDomainConfig(
      clockEdge = RISING, resetKind = ASYNC, resetActiveLevel = LOW
    )
  )

  val fifoClockArea = new ClockingArea(fifoClock) {
    val fifoReg = Vec(Reg(UInt(dataWidth bits)) init(0), scala.math.pow(2, depth).toInt)
    val writeCount = Reg(UInt(depth+1 bits)) init (0)
    val readCount = Reg(UInt(depth+1 bits)) init (0)
  }
  fifoClockArea.setName("")

  val writeAddr = fifoClockArea.writeCount(0 until depth)
  writeAddr.asOutput()
  val readAddr = fifoClockArea.readCount(0 until depth)
  readAddr.asOutput()
  val writeFlag = fifoClockArea.writeCount(depth)
  val readFlag = fifoClockArea.readCount(depth)

  io.full := (writeFlag ^ readFlag) & (writeAddr === readAddr) & ~io.readEnable
  io.empty := ~(writeFlag ^ readFlag) & (writeAddr === readAddr)

  val writeEnables = Vec(Bool(), scala.math.pow(2, depth).toInt)
  val insertEnables = Vec(Bool(), scala.math.pow(2, depth).toInt)
  for (i <- 0 until scala.math.pow(2, depth).toInt) {
    when(writeAddr === i) {
      writeEnables(i) := io.writeEnable
    } otherwise {
      writeEnables(i) := False
    }
  }

  for (i <- 0 until scala.math.pow(2, depth).toInt) {
    when(io.insertAddr === i) {
      insertEnables(i) := io.insertEnable
    } otherwise {
      insertEnables(i) := False
    }
  }

  for (i <- 0 until scala.math.pow(2, depth).toInt) {
    when(writeEnables(i)) {
      fifoClockArea.fifoReg(i) := io.writeData
    } otherwise when(insertEnables(i)) {
      fifoClockArea.fifoReg(i) := io.insertData
    }
  }

  /**
   * Double Port Mem
   */
  io.readData := fifoClockArea.fifoReg(readAddr)


  /**
   * Empty/Full
   */

  when(io.writeEnable) {
    when(~io.full) {
      fifoClockArea.writeCount := fifoClockArea.writeCount + 1
    }
  }
  when(io.readEnable) {
    when(~io.empty) {
      fifoClockArea.readCount := fifoClockArea.readCount + 1
    }
  }
//  when(io.insertEnable) {
//    fifoClockArea.insertAddr := fifoClockArea.insertAddr + 1
//  }

}
object FifoVerilog extends App {
  Config.spinal.generateVerilog(new FIFO(32, 4))
}