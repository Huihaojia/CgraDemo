package FuncModule

import spinal.core._
import spinal.core.sim._
import spinal.sim._
import Simulation._
import PE._

object ModuleTestSim extends App {

  def setStreamAluInput(func: StreamAlu, op: Int, in1: Int, in2: Int): Unit = {
    func.io.opcodeIn #= op
    func.io.dataIn1 #= in1
    func.io.dataIn2 #= in2
    func.streamAluClock.waitRisingEdge()
    while (func.io.stall.toBoolean == true) {
      func.streamAluClock.waitRisingEdge()
    }
  }

  Config.sim.compile(new StreamAlu(32, 2)).doSim { dut =>
    dut.streamAluClock.forkStimulus(10)
    dut.io.flatten.foreach{ s =>
      if(s.isInput) {
        s match {
          case b: Bool => b #= false
          case bs: Bits => bs #= 0
          case u: UInt => u #= 0
          case _ =>
        }
      }
    }
//    问题在于当MUL被延迟一个周期的时候，会对外输出stall
    dut.streamAluClock.waitRisingEdge(10)
    setStreamAluInput(dut, 3<<3, 2, 2)
    setStreamAluInput(dut, 1, 2, 2)
    setStreamAluInput(dut, 2<<3, 2, 2)
    setStreamAluInput(dut, 1, 2, 2)
    setStreamAluInput(dut, 1, 2, 2)
    setStreamAluInput(dut, 1, 2, 2)
    setStreamAluInput(dut, 3<<3, 2, 2)
    setStreamAluInput(dut, 3<<3, 3, 3)
    setStreamAluInput(dut, 3<<3, 4, 4)
    setStreamAluInput(dut, 2<<3, 2, 2)
    setStreamAluInput(dut, 2<<3, 3, 3)
    setStreamAluInput(dut, 2<<3, 4, 4)
    setStreamAluInput(dut, 3<<3, 2, 2)
    setStreamAluInput(dut, 3<<3, 2, 2)
    setStreamAluInput(dut, 0, 0, 0)
    dut.streamAluClock.waitRisingEdge(10)
  }
}
