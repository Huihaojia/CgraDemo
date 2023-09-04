package Simulation

import spinal.lib._
import spinal.core._
import spinal.core.sim._
import PE._

import scala.collection.mutable._


object PeSim extends App {
  var clockDFG = 0
  val executeDFG = ArrayBuffer[ArrayBuffer[Int]]()
  val writeBackDFG = ArrayBuffer[ArrayBuffer[Int]]()

  val configs = ArrayBuffer[Int]()
  configs += Integer.parseInt("1111110100010000", 2)
  configs += Integer.parseInt("1101110100110000", 2)
  configs += Integer.parseInt("1011110100010000", 2)
  configs += Integer.parseInt("1001110100010000", 2)
  configs += Integer.parseInt("1111110100010000", 2)
  configs += Integer.parseInt("1101110100010000", 2)
  configs += Integer.parseInt("1011110100010000", 2)
  configs += Integer.parseInt("1001110100010000", 2)
  Config.sim.compile(new ProcessElement()).doSim { dut =>

    dut.icgClockDomain.forkStimulus(period = 10)
    SimFunction.initialSignals(dut, dut.peClock, dut.reset)
    dut.icgClockDomain.waitRisingEdge()

    /**
     * 初始化PE内的配置
     */
    initialPe(configs.toArray)

    dut.icgClockDomain.waitRisingEdge()
    invalidPE(0, dut)
    dut.icgClockDomain.waitRisingEdge()

    /**
     * token流基本测试
     */
    for (i <- 0 to 20) {
      if (i == 0) dut.interface.setup.peStart #= true
      else dut.interface.setup.peStart #= false
      if (i == 3) {
        validPE(i, credit = Array(true, true, true, true), input = Array(2, 3, 0, 0), dut = dut)
      } else if(i == 4) {
        validPE(i, credit = Array(true, true, true, true), input = Array(2, 3, 0, 5), dut = dut)
      } else if(i == 5 | i == 6) {
        validPE(i, credit = Array(true, true, true, true), input = Array(0, 0, 0, 0), dut = dut)
      } else {
        invalidPE(i, dut)
      }
      dut.icgClockDomain.waitRisingEdge()
    }

    printDFG(executeDFG)

    def initialPe(configs: Array[Int]): Unit = {
      for(i <- 0 to configs.length) {
        if(i == configs.length) {
          println("---Initial Finish---")
        }
        else {
          dut.interface.setup.writeEnable #= true
          dut.interface.setup.writeConfig #= configs(i)
          dut.icgClockDomain.waitRisingEdge()
        }
      }
    }
  }

  def printStage(clk: Int, dut: ProcessElement): Unit = {
    println("----- CLK " + clk + " -----")
    dut.interface.printFetchStage()
    dut.interface.printAssignStage()
    dut.interface.printDecodeStage()
    dut.interface.printExecuteStage()
  }

  def validPE(clk: Int, token: Array[Boolean] = Array.fill(4)(false), credit: Array[Boolean] = Array.fill(4)(true), input: Array[Int], dut: ProcessElement): Unit = {
    dut.interface.setup.writeEnable #= false
    for (i <- 0 until token.length) {
      dut.interface.setup.tokenIn(i) #= token(i)
      dut.interface.setup.dataIn(i) #= input(i)
      dut.interface.setup.creditIn(i) #= credit(i)
    }
    printStage(clk, dut)
    updateDFG(dut)
  }

  def invalidPE(clk: Int, dut: ProcessElement) = {
    dut.interface.setup.writeEnable #= false
    for (i <- 0 until 4) {
      dut.interface.setup.tokenIn(i) #= false
      dut.interface.setup.dataIn(i) #= 0
      dut.interface.setup.creditIn(i) #= true
    }
    printStage(clk, dut)
    updateDFG(dut)
  }

  def updateDFG(Pe: ProcessElement): Unit = {
    val executeLine = ArrayBuffer[Int]()
    //      val writeBackLine = ArrayBuffer[Int]()
    executeLine += clockDFG
    for (i <- 0 until Pe.interface.setup.tokenOut.length) {
      if (Pe.interface.setup.tokenOut(i).toBoolean) {
        executeLine += Pe.interface.setup.dataOut(i).toInt
      }
    }
    executeDFG += executeLine
    clockDFG += 1
  }

  def printDFG(DFG: ArrayBuffer[ArrayBuffer[Int]]): Unit = {
    DFG.foreach { l =>
      l.foreach { e =>

        print(s"$e\t")
      }
      println()
    }
  }
}
