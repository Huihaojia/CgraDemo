//package connection
//
//import math._
//import spinal.lib._
//import spinal.core._
//import spinal.lib.pipeline._
//import spinal.lib.pipeline.Connection._
//import PE._
//
//import scala.collection.mutable
//import scala.collection.mutable.ArrayBuffer
//
//case class PeCoordinate(x: Int, y: Int)
//
//class DataLocation(var loc: PeCoordinate = PeCoordinate(0, 0)) {
//  val dataIn: ArrayBuffer[Data] = ArrayBuffer[Data]()
//  val dataOut: ArrayBuffer[Data] = ArrayBuffer[Data]()
//}
//
//object ConnectionSignals {
//  val inputList = Array("dataIn", "tokenIn", "creditIn")
//  val outputList = Array("dataOut", "tokenOut", "creditOut")
//}
//
//trait Connection {
//  val connectionArray: Array[Array[ArrayBuffer[PeCoordinate]]]
//  var connectionSignals: Array[Array[DataLocation]]
//  val xNum: Int
//  val yNum: Int
//
//  def initialSignalList(Pea: Array[Array[ProcessElement]]): Array[Array[ProcessElement]] = {
//    for(i <- 0 until xNum) {
//      for(j <- 0 until yNum) {
//        connectionSignals(i)(j).loc = PeCoordinate(i, j)
//        Pea(i)(j).io.flatten.toArray.foreach {s =>
//          val name = s.getName()
//          ConnectionSignals.inputList.foreach{c =>
//            if(name.contains(c)) {
//              connectionSignals(i)(j).dataIn += s
//            }
//          }
//          ConnectionSignals.outputList.foreach { c =>
//            if (name.contains(c)) {
//              connectionSignals(i)(j).dataOut += s
//            }
//          }
//        }
//      }
//    }
//    Pea
//  }
//
//  def connect(): Unit = {
//    for(i <- 0 until connectionArray.length) {
//      for(j <- 0 until connectionArray(i).length) {
//        connectionArray(i)(j).foreach {dst =>
//          //Connect Inputs
//          import connection.{PeCoordinate => loc}
//          for(k <- 0 until connectionSignals(i)(j).dataIn.length) {
//            connectionSignals(i)(j).dataIn(k) match {
//              case u: Vec[UInt] => {
//                //本坐标和目标坐标比较，
//                u(peDirection(i, j, dst.x, dst.y)) := connectionSignals(dst.y)(dst.x).dataIn(k)
//              }
//              case b: Vec[Bool] => {
//
//              }
//            }
//          }
//        }
//      }
//    }
//  }
//
//  def peDirection(srcX: Int, srcY: Int, dstX: Int, dstY: Int): Int = {
//    if(srcX > dstX) 1
//    else if(srcX < dstX) 3
//    else if(srcY > dstY) 0
//    else if(srcY < dstY) 2
//    else 4
//  }
//}
//
