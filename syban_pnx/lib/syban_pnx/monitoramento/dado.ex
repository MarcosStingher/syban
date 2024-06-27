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

    timestamps()
  end

  @doc false
  def changeset(dado, attrs) do
    dado
    |> cast(attrs, [:cpuPercentual, :datahora, :discoPercentual, :discoTotal, :discoUsado, :freqCPU, :gpuMemLivre, :gpuMemTot, :gpuMemUsada, :gpuNome, :gpuTemp, :gpuUsada, :memPercentual, :memRamTotal, :memRamUsada, :processFisico, :processLogico, :idmaquina])
    |> validate_required([:cpuPercentual, :datahora, :discoPercentual, :discoTotal, :discoUsado, :freqCPU, :gpuMemLivre, :gpuMemTot, :gpuMemUsada, :gpuNome, :gpuTemp, :gpuUsada, :memPercentual, :memRamTotal, :memRamUsada, :processFisico, :processLogico, :idmaquina])
  end
end
