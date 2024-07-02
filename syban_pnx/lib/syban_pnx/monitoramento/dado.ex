defmodule SybanPnx.Monitoramento.Dado do
  use Ecto.Schema
  import Ecto.Changeset

  schema "monitoramento" do
    field :datahora, :utc_datetime
    field :idmaquina, :integer
    field :memRamTotal, :decimal
    field :memRamUsada, :decimal
    field :memPercentual, :decimal
    field :discoTotal, :decimal
    field :discoUsado, :decimal
    field :discoPercentual, :decimal
    field :cpuPercentual, :decimal
    field :processLogico, :integer
    field :processFisico, :integer
    field :freqCPU, :decimal
    field :gpuNome, :string
    field :gpuUsada, :decimal
    field :gpuTemp, :decimal
    field :gpuMemTot, :decimal
    field :gpuMemUsada, :decimal
    field :gpuMemLivre, :decimal
    field :idevento, :integer, default: 1

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(dado, attrs) do
    dado
    |> cast(attrs, [:datahora, :idmaquina, :memRamTotal, :memRamUsada, :memPercentual, :discoTotal, :discoUsado, :discoPercentual, :cpuPercentual, :processLogico, :processFisico, :freqCPU, :gpuNome, :gpuUsada, :gpuTemp, :gpuMemTot, :gpuMemUsada, :gpuMemLivre, :idevento])
    |> validate_required([:datahora, :idmaquina, :memRamTotal, :memRamUsada, :memPercentual, :discoTotal, :discoUsado, :discoPercentual, :cpuPercentual, :processLogico, :processFisico, :freqCPU, :gpuNome, :gpuUsada, :gpuTemp, :gpuMemTot, :gpuMemUsada, :gpuMemLivre, :idevento])
  end
end
