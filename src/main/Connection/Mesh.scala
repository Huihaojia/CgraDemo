//package connection
//
//import scala.collection.mutable.ArrayBuffer
//
//class MeshConnection(xSum: Int, ySum: Int) extends Connection {
//  val connectionArray = Array.fill(xSum)(Array.fill(ySum)(ArrayBuffer[PeCoordinate]()))
//  val xNum = xSum
//  val yNum = ySum
//  val connectionSignals = Array[Array[DataLocation]]()
//
//  def createConnection(list: Array[Array[ArrayBuffer[PeCoordinate]]] = this.connectionArray): Unit = {
//    for (i <- 0 until xSum) {
//      for (j <- 0 until ySum) {
//        import connection.{PeCoordinate => loc}
//        (i, j) match {
//          case (0, 0) =>
//            list(i)(j) ++= Array(loc(i + 1, j), loc(i, j + 1))
//          case (this.xNum, 0) =>
//            list(i)(j) ++= Array(loc(i - 1, j), loc(i, j + 1))
//          case (0, this.yNum) =>
//            list(i)(j) ++= Array(loc(i + 1, j), loc(i, j - 1))
//          case (this.xNum, this.yNum) =>
//            list(i)(j) ++= Array(loc(i - 1, j), loc(i, j - 1))
//          case (0, _) =>
//            list(i)(j) ++= Array(loc(i + 1, j), loc(i, j - 1), loc(i, j + 1))
//          case (this.xNum, _) =>
//            list(i)(j) ++= Array(loc(i - 1, j), loc(i, j - 1), loc(i, j + 1))
//          case (_, 0) =>
//            list(i)(j) ++= Array(loc(i, j + 1), loc(i - 1, j), loc(i + 1, j))
//          case (_, this.yNum) =>
//            list(i)(j) ++= Array(loc(i, j - 1), loc(i - 1, j), loc(i + 1, j))
//          case (_, _) =>
//            list(i)(j) ++= Array(loc(i, j - 1), loc(i, j + 1), loc(i - 1, j), loc(i + 1, j))
//        }
//        //        list(i)(j).foreach(s => print(s + "\t"))
//        //        println("")
//      }
//      //      println("")
//    }
//  }
//}
//
//object MeshConnection {
//  def apply(xSum: Int, ySum: Int) = {
//    val l = new MeshConnection(xSum, ySum)
//    l.createConnection()
//    l
//  }
//}
