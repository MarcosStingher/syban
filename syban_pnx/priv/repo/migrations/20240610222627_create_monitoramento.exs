defmodule SybanPnx.Repo.Migrations.CreateMonitoramento do
  use Ecto.Migration

  def change do
    create table(:monitoramento) do
      add :datahora, :utc_datetime, default: fragment("CURRENT_TIMESTAMP"), null: false
      add :idmaquina, references(:dispositivo, type: :bigint, column: :id, on_delete: :nothing)
      add :memRamTotal, :decimal, precision: 12, scale: 2
      add :memRamUsada, :decimal, precision: 12, scale: 2
      add :memPercentual, :decimal, precision: 12, scale: 2
      add :discoTotal, :decimal, precision: 12, scale: 2
      add :discoUsado, :decimal, precision: 12, scale: 2
      add :discoPercentual, :decimal, precision: 12, scale: 2
      add :cpuPercentual, :decimal, precision: 5, scale: 2
      add :processLogico, :integer
      add :processFisico, :integer
      add :freqCPU, :decimal, precision: 6, scale: 3
      add :gpuNome, :string, size: 200
      add :gpuUsada, :decimal, precision: 5, scale: 2
      add :gpuTemp, :decimal, precision: 5, scale: 2
      add :gpuMemTot, :decimal, precision: 8, scale: 2
      add :gpuMemUsada, :decimal, precision: 8, scale: 2
      add :gpuMemLivre, :decimal, precision: 8, scale: 2
      add :idevento, :integer, default: 1

      timestamps(type: :utc_datetime)
    end
  end
end
