defmodule SybanPnx.Monitoramento.Evento do
  use Ecto.Schema
  import Ecto.Changeset

  schema "eventos" do
    field :urgencia, :integer
    field :impacto, :integer
    field :memRamTotal, :string
    field :memRamUsada, :string
    field :memPercentual, :string
    field :discoTotal, :string
    field :discoUsado, :string
    field :discoPercentual, :string
    field :cpuPercentual, :string
    field :processLogico, :string
    field :processFisico, :string
    field :freqCPU, :string
    field :gpuUsada, :string
    field :gpuTemp, :string
    field :gpuMemTot, :string
    field :gpuMemUsada, :string
    field :gpuMemLivre, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(evento, attrs) do
    evento
    |> cast(attrs, [:icvinculada, :evento, :urgencia, :impacto])
    |> validate_required([:icvinculada, :evento, :urgencia, :impacto])
  end
end
