defmodule SybanPnxWeb.EventoJSON do
  alias SybanPnx.Eventos.Evento

  @doc """
  Renders a list of eventos.
  """
  def index(%{eventos: eventos}) do
    %{data: for(evento <- eventos, do: data(evento))}
  end

  @doc """
  Renders a single evento.
  """
  def show(%{evento: evento}) do
    %{data: data(evento)}
  end

  defp data(%Evento{} = evento) do
    %{
      id: evento.id,
      freqCPUImpacto: evento.freqCPUImpacto,
      processFisicoUrgencia: evento.processFisicoUrgencia,
      gpuUsadaImpacto: evento.gpuUsadaImpacto,
      gpuTempImpacto: evento.gpuTempImpacto,
      gpuTempUrgencia: evento.gpuTempUrgencia,
      processFisico: evento.processFisico,
      cpuPercentualImpacto: evento.cpuPercentualImpacto,
      freqCPU: evento.freqCPU,
      cpuPercentualUrgencia: evento.cpuPercentualUrgencia,
      memRamUsadaUrgencia: evento.memRamUsadaUrgencia,
      gpuMemUsada: evento.gpuMemUsada,
      processLogicoUrgencia: evento.processLogicoUrgencia,
      gpuTemp: evento.gpuTemp,
      discoUsado: evento.discoUsado,
      memPercentual: evento.memPercentual,
      processLogico: evento.processLogico,
      discoPercentualUrgencia: evento.discoPercentualUrgencia,
      memPercentualUrgencia: evento.memPercentualUrgencia,
      gpuUsada: evento.gpuUsada,
      gpuMemUsadaUrgencia: evento.gpuMemUsadaUrgencia,
      discoUsadoUrgencia: evento.discoUsadoUrgencia,
      gpuUsadaUrgencia: evento.gpuUsadaUrgencia,
      discoPercentual: evento.discoPercentual,
      memRamUsada: evento.memRamUsada,
      processFisicoImpacto: evento.processFisicoImpacto,
      processLogicoImpacto: evento.processLogicoImpacto,
      memRamUsadaImpacto: evento.memRamUsadaImpacto,
      memPercentualImpacto: evento.memPercentualImpacto,
      gpuMemUsadaImpacto: evento.gpuMemUsadaImpacto,
      discoPercentualImpacto: evento.discoPercentualImpacto,
      freqCPUUrgencia: evento.freqCPUUrgencia,
      cpuPercentual: evento.cpuPercentual,
      discoUsadoImpacto: evento.discoUsadoImpacto
    }
  end
end
