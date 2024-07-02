defmodule SybanPnx.Repo.Migrations.CreateEventos do
  use Ecto.Migration

  def change do
    create table(:eventos) do
      add :memRamUsada, :string
      add :memRamUsadaUrgencia, :integer
      add :memRamUsadaImpacto, :integer
      add :memPercentual, :string
      add :memPercentualUrgencia, :integer
      add :memPercentualImpacto, :integer
      add :discoUsado, :string
      add :discoUsadoUrgencia, :integer
      add :discoUsadoImpacto, :integer
      add :discoPercentual, :string
      add :discoPercentualUrgencia, :integer
      add :discoPercentualImpacto, :integer
      add :cpuPercentual, :string
      add :cpuPercentualUrgencia, :integer
      add :cpuPercentualImpacto, :integer
      add :processLogico, :string
      add :processLogicoUrgencia, :integer
      add :processLogicoImpacto, :integer
      add :processFisico, :string
      add :processFisicoUrgencia, :integer
      add :processFisicoImpacto, :integer
      add :freqCPU, :string
      add :freqCPUUrgencia, :integer
      add :freqCPUImpacto, :integer
      add :gpuUsada, :string
      add :gpuUsadaUrgencia, :integer
      add :gpuUsadaImpacto, :integer
      add :gpuTemp, :string
      add :gpuTempUrgencia, :integer
      add :gpuTempImpacto, :integer
      add :gpuMemUsada, :string
      add :gpuMemUsadaUrgencia, :integer
      add :gpuMemUsadaImpacto, :integer

      timestamps(type: :utc_datetime)
    end
  end
end
