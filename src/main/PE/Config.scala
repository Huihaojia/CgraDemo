package PE

import spinal.core.{ClockDomainConfig, LOW, SpinalConfig}
import spinal.core.sim.SimConfig

object Config {
  def spinal = SpinalConfig(
    targetDirectory = "src/output",
    onlyStdLogicVectorAtTopLevelIo = true
  )

  def sim = SimConfig
    .withFstWave.allOptimisation.workspacePath("./tb")
}
