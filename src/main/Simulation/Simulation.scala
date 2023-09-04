package Simulation

import PE._
import PEA._
import spinal.lib._
import spinal.core._
import spinal.core.sim._

import scala.collection.mutable._
//
object SimFunction {
  def getDirection(s: UInt): String = {
    val src = s.toInt match {
      case 0 => "UP"
      case 1 => "RIGHT"
      case 2 => "DOWN"
      case 3 => "LEFT"
      case _ => "None"
    }
    src
  }
//
  def initialSignals(PE: ProcessElement, useless: Data*): Unit = {
    val list = new ArrayBuffer[Data]

    PE.getAllIo.foreach{s =>
      if(s.isInput & !useless.contains(s)) list += s
    }
    list.foreach { s =>
      s match {
        case b: Bool => b #= false
        case bs: Bits => bs #= 0
        case u: UInt => u #= 0
      }
    }
  }

  def initialPeaSignals(PE: ProcessElementArray, useless: Data*): Unit = {
    val list = new ArrayBuffer[Data]
    PE.io.flatten.foreach { s =>
      if (s.isInput & !useless.contains(s)) list += s
    }
    list.foreach { s =>
      s match {
        case b: Bool => b #= false
        case bs: Bits => bs #= 0
        case u: UInt => u #= 0
      }
    }
  }
}