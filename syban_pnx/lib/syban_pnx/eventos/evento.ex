defmodule SybanPnx.Eventos.Evento do
  use Ecto.Schema
  import Ecto.Changeset

  schema "eventos" do
    field :memRamUsada, :string
    field :memRamUsadaUrgencia, :integer
    field :memRamUsadaImpacto, :integer
    field :memRamUsadaSolucao, :string
    field :memPercentual, :string
    field :memPercentualUrgencia, :integer
    field :memPercentualImpacto, :integer
    field :memPercentualSolucao, :string
    field :discoUsado, :string
    field :discoUsadoUrgencia, :integer
    field :discoUsadoImpacto, :integer
    field :discoUsadoSolucao, :string
    field :discoPercentual, :string
    field :discoPercentualUrgencia, :integer
    field :discoPercentualImpacto, :integer
    field :discoPercentualSolucao, :string
    field :cpuPercentual, :string
    field :cpuPercentualUrgencia, :integer
    field :cpuPercentualImpacto, :integer
    field :cpuPercentualSolucao, :string
    field :processLogico, :string
    field :processLogicoUrgencia, :integer
    field :processLogicoImpacto, :integer
    field :processLogicoSolucao, :string
    field :processFisico, :string
    field :processFisicoUrgencia, :integer
    field :processFisicoImpacto, :integer
    field :processFisicoSolucao, :string
    field :freqCPU, :string
    field :freqCPUUrgencia, :integer
    field :freqCPUImpacto, :integer
    field :freqCPUSolucao, :string
    field :gpuUsada, :string
    field :gpuUsadaUrgencia, :integer
    field :gpuUsadaImpacto, :integer
    field :gpuUsadaSolucao, :string
    field :gpuTemp, :string
    field :gpuTempUrgencia, :integer
    field :gpuTempImpacto, :integer
    field :gpuTempSolucao, :string
    field :gpuMemUsada, :string
    field :gpuMemUsadaUrgencia, :integer
    field :gpuMemUsadaImpacto, :integer
    field :gpuMemUsadaSolucao, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(evento, attrs) do
    evento
    |> cast(attrs, [
      :memRamUsada, :memRamUsadaUrgencia, :memRamUsadaImpacto, :memRamUsadaSolucao,
      :memPercentual, :memPercentualUrgencia, :memPercentualImpacto, :memPercentualSolucao,
      :discoUsado, :discoUsadoUrgencia, :discoUsadoImpacto, :discoUsadoSolucao,
      :discoPercentual, :discoPercentualUrgencia, :discoPercentualImpacto, :discoPercentualSolucao,
      :cpuPercentual, :cpuPercentualUrgencia, :cpuPercentualImpacto, :cpuPercentualSolucao,
      :processLogico, :processLogicoUrgencia, :processLogicoImpacto, :processLogicoSolucao,
      :processFisico, :processFisicoUrgencia, :processFisicoImpacto, :processFisicoSolucao,
      :freqCPU, :freqCPUUrgencia, :freqCPUImpacto, :freqCPUSolucao,
      :gpuUsada, :gpuUsadaUrgencia, :gpuUsadaImpacto, :gpuUsadaSolucao,
      :gpuTemp, :gpuTempUrgencia, :gpuTempImpacto, :gpuTempSolucao,
      :gpuMemUsada, :gpuMemUsadaUrgencia, :gpuMemUsadaImpacto, :gpuMemUsadaSolucao
    ])
    |> validate_required([
      :memRamUsada, :memRamUsadaUrgencia, :memRamUsadaImpacto,
      :memPercentual, :memPercentualUrgencia, :memPercentualImpacto,
      :discoUsado, :discoUsadoUrgencia, :discoUsadoImpacto,
      :discoPercentual, :discoPercentualUrgencia, :discoPercentualImpacto,
      :cpuPercentual, :cpuPercentualUrgencia, :cpuPercentualImpacto,
      :processLogico, :processLogicoUrgencia, :processLogicoImpacto,
      :processFisico, :processFisicoUrgencia, :processFisicoImpacto,
      :freqCPU, :freqCPUUrgencia, :freqCPUImpacto,
      :gpuUsada, :gpuUsadaUrgencia, :gpuUsadaImpacto,
      :gpuTemp, :gpuTempUrgencia, :gpuTempImpacto,
      :gpuMemUsada, :gpuMemUsadaUrgencia, :gpuMemUsadaImpacto
    ])
  end
end
