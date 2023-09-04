//package FuncModule
//
//import spinal.core._
//import spinal.sim._
//import spinal.core.sim._
//import PE._
//
//object FuncSim extends App {
//  Config.sim.compile(new FIFO(32, 4)).doSim{ dut =>
//    dut.fifoClock.forkStimulus(10)
//    dut.io.flatten.foreach { s =>
//      if (s.isInput) {
//        s match {
//          case b: Bool => b #= false
//          case bs: Bits => bs #= 0
//          case u: UInt => u #= 0
//          case _ =>
//        }
//      }
//    }
//    sleep(5)
//    dut.io.rst #= true
//    dut.fifoClock.waitRisingEdge(10)
//    for(i <- 0 until 16) {
//      dut.io.writeEnable #= true
//      dut.io.writeData #= i
//      dut.fifoClock.waitRisingEdge()
//    }
//    dut.io.writeEnable #= false
//    dut.fifoClock.waitRisingEdge()
//    for(i <- 0 until 16) {
//      dut.io.readEnable #= true
//      println(dut.io.readData.toBigInt)
//      dut.fifoClock.waitRisingEdge()
//    }
//    dut.io.readEnable #= false
//    dut.fifoClock.waitRisingEdge()
//    for (i <- 0 until 16) {
//      dut.io.writeEnable #= true
//      dut.io.writeData #= i
//      dut.fifoClock.waitRisingEdge()
//    }
//    dut.io.writeEnable #= false
//    dut.fifoClock.waitRisingEdge()
//    for (i <- 0 until 16) {
//      dut.io.writeEnable #= false
//      dut.io.insertEnable #= true
//      dut.io.insertData #= i*4
//      dut.fifoClock.waitRisingEdge()
//    }
//    for (i <- 0 until 16) {
//      dut.io.readEnable #= true
//      println(dut.io.readData.toBigInt)
//      dut.fifoClock.waitRisingEdge()
//    }
//  }
//}
