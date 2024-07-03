defmodule SybanPnx.Repo.Migrations.CreateEventos do
  use Ecto.Migration

  def change do
    create table(:eventos) do
      add :memRamUsada, :string
      add :memRamUsadaUrgencia, :integer
      add :memRamUsadaImpacto, :integer
      add :memRamUsadaSolucao, :string
      add :memPercentual, :string
      add :memPercentualUrgencia, :integer
      add :memPercentualImpacto, :integer
      add :memPercentualSolucao, :string
      add :discoUsado, :string
      add :discoUsadoUrgencia, :integer
      add :discoUsadoImpacto, :integer
      add :discoUsadoSolucao, :string
      add :discoPercentual, :string
      add :discoPercentualUrgencia, :integer
      add :discoPercentualImpacto, :integer
      add :discoPercentualSolucao, :string
      add :cpuPercentual, :string
      add :cpuPercentualUrgencia, :integer
      add :cpuPercentualImpacto, :integer
      add :cpuPercentualSolucao, :string
      add :processLogico, :string
      add :processLogicoUrgencia, :integer
      add :processLogicoImpacto, :integer
      add :processLogicoSolucao, :string
      add :processFisico, :string
      add :processFisicoUrgencia, :integer
      add :processFisicoImpacto, :integer
      add :processFisicoSolucao, :string
      add :freqCPU, :string
      add :freqCPUUrgencia, :integer
      add :freqCPUImpacto, :integer
      add :freqCPUSolucao, :string
      add :gpuUsada, :string
      add :gpuUsadaUrgencia, :integer
      add :gpuUsadaImpacto, :integer
      add :gpuUsadaSolucao, :string
      add :gpuTemp, :string
      add :gpuTempUrgencia, :integer
      add :gpuTempImpacto, :integer
      add :gpuTempSolucao, :string
      add :gpuMemUsada, :string
      add :gpuMemUsadaUrgencia, :integer
      add :gpuMemUsadaImpacto, :integer
      add :gpuMemUsadaSolucao, :string

      timestamps(type: :utc_datetime)
    end
  end
end
