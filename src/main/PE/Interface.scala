package PE

import Simulation._
import Framework._
import spinal.core._
import spinal.core.sim._

trait InterfaceService extends Service {
  def printFetchStage(): Unit
  def printAssignStage(): Unit
  def printDecodeStage(): Unit
  def printExecuteStage(): Unit
//  def printWriteBackStage(): Unit
}

class InterfacePlugin(dataWidth: Int, configWidth: Int, configDepth: Int) extends Plugin with InterfaceService {
  val config = create config {
    Global.DATA_WIDTH.set(dataWidth)
    Global.CONFIG_WIDTH.set(configWidth)
    Global.CONFIG_ADDR.set(configDepth)
  }

  val setup = create early new Area {
//    val peClock = Bool()
//    val reset = Bool()
    import Global._
    val writeEnable = in Bool() simPublic()
    val writeConfig = in Bits (CONFIG_WIDTH.get bits) simPublic()
    val peStart = in Bool() simPublic()
    val dataIn = in Vec(UInt(DATA_WIDTH.get bits), 4) simPublic()
    val tokenIn = in Vec(Bool(), 4) simPublic()
    val creditIn = in Vec(Bool(), 4) simPublic()
    val dataOut = out Vec(UInt(DATA_WIDTH.get bits), 4) simPublic()
    val tokenOut = out Vec(Bool(), 4) simPublic()
    val creditOut = out Vec(Bool(), 4) simPublic()
//    getService[IcgPlugin].createIcgClk(peClock, True, reset)
  }

  setup.setName(this.getName())

  val build = create late new Area {
//    setup.peClock.asInput()
//    setup.reset.asInput()
    setup.peStart.asInput()
    setup.writeEnable.asInput()
    setup.writeConfig.asInput()
    setup.dataIn.asInput()
    setup.tokenIn.asInput()
    setup.creditIn.asInput()
    setup.dataOut.asOutput()
    setup.tokenOut.asOutput()
    setup.creditOut.asOutput()
  }

  override def printFetchStage(): Unit = {
    println("#IF1\t" + "PC = " + getService[FetchPlugin].setup.pcReg.toInt)
  }

  override def printAssignStage(): Unit = {
    println("#IF2\t" + "Config = " + getService[AssignPlugin].setup.config.toInt.toBinaryString)
  }

  override def printDecodeStage(): Unit = {
    println("#ID\t\t" + "decodeConfig = " + getService[DecodePlugin].setup.config.toInt.toBinaryString)
    if (getService[DecodePlugin].setup.imm1.toBoolean) {
      println("\t\tInput1 is Imm: " + getService[DecodePlugin].setup.input1.toInt + "\tToken: " + getService[DecodePlugin].setup.token1.toBoolean.toInt)
    } else {
      println("\t\tInput1 is From: " + SimFunction.getDirection(getService[DecodePlugin].setup.inputIndex1) + "\t" + getService[DecodePlugin].setup.input1.toInt + "\tToken: " + getService[DecodePlugin].setup.token1.toBoolean.toInt)
    }
    if (getService[DecodePlugin].setup.imm2.toBoolean) {
      println("\t\tInput2 is Imm: " + getService[DecodePlugin].setup.input2.toInt + "\tToken: " + getService[DecodePlugin].setup.token2.toBoolean.toInt)
    } else {
      println("\t\tInput2 is From: " + SimFunction.getDirection(getService[DecodePlugin].setup.inputIndex2) + "\t" + getService[DecodePlugin].setup.input2.toInt + "\tToken: " + getService[DecodePlugin].setup.token2.toBoolean.toInt)
    }
    for (i <- 0 until setup.creditIn.length) {
      print("\t\tCreditIn " + i + " = " + setup.creditIn(i).toBoolean.toInt)
    }
    println()
  }

  override def printExecuteStage(): Unit = {
    println("#EX\t\t" + "Input1 = " + getService[ExecutePlugin].setup.input1.toInt + "\tInput2 = " + getService[ExecutePlugin].setup.input2.toInt)
    for (i <- 0 until setup.dataOut.length) {
      print("\t\tOutput " + i + " = " + setup.dataOut(i).toInt + " | " + setup.tokenOut(i).toBoolean.toInt)
    }
    println()
    for (i <- 0 until setup.creditOut.length) {
      print("\t\tCreditOut " + i + " = " + setup.creditOut(i).toBoolean.toInt)
    }
    println()
  }
}