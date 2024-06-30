defmodule SybanPnx.Eventos.Evento do
  use Ecto.Schema
  import Ecto.Changeset

  schema "eventos" do
    field :freqCPUImpacto, :integer
    field :processFisicoUrgencia, :integer
    field :gpuUsadaImpacto, :integer
    field :gpuTempImpacto, :integer
    field :gpuTempUrgencia, :integer
    field :processFisico, :string
    field :cpuPercentualImpacto, :integer
    field :freqCPU, :string
    field :cpuPercentualUrgencia, :integer
    field :memRamUsadaUrgencia, :integer
    field :gpuMemUsada, :string
    field :processLogicoUrgencia, :integer
    field :gpuTemp, :string
    field :discoUsado, :string
    field :memPercentual, :string
    field :processLogico, :string
    field :discoPercentualUrgencia, :integer
    field :memPercentualUrgencia, :integer
    field :gpuUsada, :string
    field :gpuMemUsadaUrgencia, :integer
    field :discoUsadoUrgencia, :integer
    field :gpuUsadaUrgencia, :integer
    field :discoPercentual, :string
    field :memRamUsada, :string
    field :processFisicoImpacto, :integer
    field :processLogicoImpacto, :integer
    field :memRamUsadaImpacto, :integer
    field :memPercentualImpacto, :integer
    field :gpuMemUsadaImpacto, :integer
    field :discoPercentualImpacto, :integer
    field :freqCPUUrgencia, :integer
    field :cpuPercentual, :string
    field :discoUsadoImpacto, :integer

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(evento, attrs) do
    evento
    |> cast(attrs, [:memRamUsada, :memRamUsadaUrgencia, :memRamUsadaImpacto, :memPercentual, :memPercentualUrgencia, :memPercentualImpacto, :discoUsado, :discoUsadoUrgencia, :discoUsadoImpacto, :discoPercentual, :discoPercentualUrgencia, :discoPercentualImpacto, :cpuPercentual, :cpuPercentualUrgencia, :cpuPercentualImpacto, :processLogico, :processLogicoUrgencia, :processLogicoImpacto, :processFisico, :processFisicoUrgencia, :processFisicoImpacto, :freqCPU, :freqCPUUrgencia, :freqCPUImpacto, :gpuUsada, :gpuUsadaUrgencia, :gpuUsadaImpacto, :gpuTemp, :gpuTempUrgencia, :gpuTempImpacto, :gpuMemUsada, :gpuMemUsadaUrgencia, :gpuMemUsadaImpacto])
    |> validate_required([:memRamUsada, :memRamUsadaUrgencia, :memRamUsadaImpacto, :memPercentual, :memPercentualUrgencia, :memPercentualImpacto, :discoUsado, :discoUsadoUrgencia, :discoUsadoImpacto, :discoPercentual, :discoPercentualUrgencia, :discoPercentualImpacto, :cpuPercentual, :cpuPercentualUrgencia, :cpuPercentualImpacto, :processLogico, :processLogicoUrgencia, :processLogicoImpacto, :processFisico, :processFisicoUrgencia, :processFisicoImpacto, :freqCPU, :freqCPUUrgencia, :freqCPUImpacto, :gpuUsada, :gpuUsadaUrgencia, :gpuUsadaImpacto, :gpuTemp, :gpuTempUrgencia, :gpuTempImpacto, :gpuMemUsada, :gpuMemUsadaUrgencia, :gpuMemUsadaImpacto])
  end
end
