package Simulation

import PE._
import PEA._
import spinal.lib._
import spinal.core._
import spinal.core.sim._

import scala.collection.mutable._

object PeaSim extends App {
  var clockDFG = 0
  val executeDFG = ArrayBuffer[ArrayBuffer[Int]]()

  Config.sim.compile(new ProcessElementArray(2, 2)).doSim { dut =>
    dut.peaClock.forkStimulus(period = 10)
    SimFunction.initialPeaSignals(dut, dut.io.reset, dut.io.clock)
    dut.peaClock.waitRisingEdge()
    val configs = ArrayBuffer[Array[Int]]()
    configs += Array(Integer.parseInt("1111110100010000", 2), Integer.parseInt("0111111000110000", 2), Integer.parseInt("0011110000110000", 2), Integer.parseInt("0001111100010000", 2))
    configs += Array(Integer.parseInt("0101110100010000", 2), Integer.parseInt("0111111000010000", 2), Integer.parseInt("0011110000010000", 2), Integer.parseInt("0001111100010000", 2))
    configs += Array(Integer.parseInt("0101010100010000", 2), Integer.parseInt("0111101000010000", 2), Integer.parseInt("0011010000010000", 2), Integer.parseInt("0001110100010000", 2))
    configs += Array(Integer.parseInt("0101100100010000", 2), Integer.parseInt("0111110000010000", 2), Integer.parseInt("0011100000010000", 2), Integer.parseInt("0001111000010000", 2))
    configs += Array(Integer.parseInt("0101110100010000", 2), Integer.parseInt("0111111000010000", 2), Integer.parseInt("0011110000010000", 2), Integer.parseInt("0001111100010000", 2))
    initialPea(configs.toArray)

    dut.peaClock.waitRisingEdge()
    dut.io.tokenIn.foreach(_ #= true)
    dut.io.creditIn.foreach(_ #= true)
    dut.io.dataIn.foreach(_ #= 2)
    for(i <- 0 until 30) {
      if (i == 0) dut.io.start #= true
      else dut.io.start #= false
      updateDFGPea(i, dut.PEA)
      dut.peaClock.waitRisingEdge()
    }

    printDFGPea(executeDFG)

    def initialPea(configs: Array[Array[Int]]): Unit = {
      for (i <- 0 to configs.length) {
        if (i == configs.length) {
          dut.io.writeEnable #= false
          dut.peaClock.waitRisingEdge()
        }
        else {
          dut.io.writeEnable #= true
          for(x <- 0 until 2) {
            for(y <- 0 until 2) {
              dut.io.writeConfig(x*2+y) #= configs(i)(x*2+y)
            }
          }
          dut.peaClock.waitRisingEdge()
        }
      }
    }
  }

  def assignVecInt(v: Vec[UInt], a: Array[Int] = Array(2, 3), index: Array[Int]) = {
    for (i <- 0 until a.length) {
      v(index(i)).asInput() #= a(index(i))
    }
  }

  def assignVecBool(v: Vec[Bool], a: Array[Boolean] = Array(true, true), index: Array[Int]) = {
    for (i <- 0 until a.length) {
      v(index(i)).asInput() #= a(index(i))
    }
  }

  def updateDFGPea(clk: Int, Pea: Array[Array[ProcessElement]]): Unit = {
    val executeLine = ArrayBuffer[Int]()
    //      val writeBackLine = ArrayBuffer[Int]()
    executeLine += clockDFG

    for(y <- 0 until 2) {
      for(x <- 0 until 2) {
        println(s"\n#PE: $y $x")
        PeSim.printStage(clk, Pea(y)(x))
        for (i <- 0 until Pea(y)(x).interface.setup.tokenOut.length) {
          if (Pea(y)(x).interface.setup.tokenOut(i).toBoolean) {
            executeLine += Pea(y)(x).interface.setup.dataOut(i).toInt
          }
        }
        println()
      }
      println("#####")
    }

    executeDFG += executeLine
    clockDFG += 1
  }

  def printDFGPea(DFG: ArrayBuffer[ArrayBuffer[Int]]): Unit = {
    DFG.foreach { l =>
      l.foreach { e =>

        print(s"$e\t")
      }
      println()
    }
  }
}

