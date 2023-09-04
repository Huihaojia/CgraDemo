package PE

trait MyConfig

object Opcode extends MyConfig {
  val Add = "000001"
  val Sub = "000010"
  val Mul = "000011"
  val None = "000000"
}

object Inputs extends MyConfig {
  val Self = "00000000"
  val Up = "00000001"
  val Right = "00000010"
  val Down = "00000011"
  val Left = "00000100"
  def setImm(imm: Int): String = {
    val s = imm.toBinaryString
    val zeros = Array.fill(7-s.length)("0").mkString
    val temp = "1" + zeros + s
    temp
  }
}

object Outputs extends MyConfig {
  val Self = "00000000"
  val Up = "00000001"
  val Right = "00000010"
  val Down = "00000011"
  val Left = "00000100"
}

object Sync extends MyConfig {
  def stringPadding(imm: Int, length: Int): String = {
    val s = imm.toBinaryString
    val zeros = Array.fill(length-s.length)("0").mkString
    zeros + s
  }

  val tokenSync = "10"
  val creditSync = "11"

  def getSync(channelIndex: Int, syncCount: Int, syncType: String): String = {
    stringPadding(channelIndex, 4) + stringPadding(syncCount, 6) + syncType
  }
}

object Lock extends MyConfig {
  val lockOn = "1"
  val lockOff = "0"
}

object ConfigType extends MyConfig {
  val Top = "0"
  val Alu = "1"
}

object Configuration {
  def configure(opcode: String, input1: String, input2: String, input3: String, output1: String, lock: String, index: Int, count: Int, sync: String, t: String): String = {
    opcode + input1 + input2 + input3 + output1 + "000000000000" + lock + Sync.getSync(index, count, sync) + t
  }

//  def main(args: Array[String]): Unit = {
//    val cc: String = Configuration.configure(
//      opcode = Opcode.Add,
//      input1 = Inputs.Self,
//      input2 = Inputs.setImm(10),
//      input3 = Inputs.Self,
//      output1 = Outputs.Self,
//      lock = Lock.lockOff,
//      index = 2,
//      count = 4,
//      sync = Sync.tokenSync,
//      t = ConfigType.Alu)
//    println(cc)
//    println(cc.length)
//  }
}