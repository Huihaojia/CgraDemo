package Fifo

import spinal.core._
import spinal.lib._
import spinal.core.sim._

class pointer(depth: Int) extends Bundle {
  val length = log2Up(depth)
  val ptr = Reg(UInt(length + 2 bits)) init(0)
  val index = ptr(0 until length)
  val flag = ptr(length until (length + 2))
}

trait FifoInterface[T <: Data] {
  val depth: Int
  val fifoClock: ClockDomain
  val length = log2Up(depth)

  val enqPtr = fifoClock on new pointer(depth)
  val deqPtr = fifoClock on new pointer(depth)

  val notEmpty = fifoClock on Reg(Bool()) init (False)
  val notFull = fifoClock on Reg(Bool()) init (True)

  def initDepth(fifoDepth: Int): Unit = {
    val depth = fifoDepth
  }
  def enq(input: T, wen: Bool): Bool
  def deq(ren: Bool): Bool
  def first: T
}

class PipelineFifo[T <: Data](dataType: HardType[T], fifoDepth: Int, initFunc: T => Unit, clockConfig: ClockDomain) extends Component with FifoInterface[T] {
  val depth = fifoDepth
  val fifoClock = clockConfig

  val dataRegs = clockConfig on Vec.fill(depth)(Reg(dataType()))
  dataRegs.foreach(initFunc)

  val ptrEqual = enqPtr.index === deqPtr.index
  val flagEqual = enqPtr.flag === deqPtr.flag
  val flagInvert = enqPtr.flag === ~deqPtr.flag

  when (ptrEqual && flagEqual) {
    notEmpty := False
  } otherwise {
    notEmpty := True
  }

  when(ptrEqual && flagInvert) {
    notFull := False
  } otherwise {
    notFull := True
  }

  def enq(dataIn: T, wen: Bool): Bool = {
    val enqPtrNext = enqPtr.ptr
    when (wen && notFull) {
      enqPtrNext := enqPtr.ptr + 1
      dataRegs(enqPtr.index) := dataIn
    }
    when (enqPtrNext === depth) {
      enqPtr.ptr := 0
    } otherwise {
      enqPtr.ptr := enqPtrNext
    }
    notFull
  }

  def deq(ren: Bool): Bool = {
    val deqPtrNext = deqPtr.ptr
    when(ren && notEmpty) {
      deqPtrNext := deqPtr.ptr + 1
    }
    when(deqPtrNext === depth) {
      deqPtr.ptr := 0
    } otherwise {
      deqPtr.ptr := deqPtrNext
    }
    notEmpty
  }

  def first: T = {
    dataRegs(deqPtr.index)
  }
}