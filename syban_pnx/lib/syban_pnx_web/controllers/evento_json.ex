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
      memRamUsada: evento.memRamUsada,
      memRamUsadaUrgencia: evento.memRamUsadaUrgencia,
      memRamUsadaImpacto: evento.memRamUsadaImpacto,
      memRamUsadaSolucao: evento.memRamUsadaSolucao,
      memPercentual: evento.memPercentual,
      memPercentualUrgencia: evento.memPercentualUrgencia,
      memPercentualImpacto: evento.memPercentualImpacto,
      memPercentualSolucao: evento.memPercentualSolucao,
      discoUsado: evento.discoUsado,
      discoUsadoUrgencia: evento.discoUsadoUrgencia,
      discoUsadoImpacto: evento.discoUsadoImpacto,
      discoUsadoSolucao: evento.discoUsadoSolucao,
      discoPercentual: evento.discoPercentual,
      discoPercentualUrgencia: evento.discoPercentualUrgencia,
      discoPercentualImpacto: evento.discoPercentualImpacto,
      discoPercentualSolucao: evento.discoPercentualSolucao,
      cpuPercentual: evento.cpuPercentual,
      cpuPercentualUrgencia: evento.cpuPercentualUrgencia,
      cpuPercentualImpacto: evento.cpuPercentualImpacto,
      cpuPercentualSolucao: evento.cpuPercentualSolucao,
      processLogico: evento.processLogico,
      processLogicoUrgencia: evento.processLogicoUrgencia,
      processLogicoImpacto: evento.processLogicoImpacto,
      processLogicoSolucao: evento.processLogicoSolucao,
      processFisico: evento.processFisico,
      processFisicoUrgencia: evento.processFisicoUrgencia,
      processFisicoImpacto: evento.processFisicoImpacto,
      processFisicoSolucao: evento.processFisicoSolucao,
      freqCPU: evento.freqCPU,
      freqCPUUrgencia: evento.freqCPUUrgencia,
      freqCPUImpacto: evento.freqCPUImpacto,
      freqCPUSolucao: evento.freqCPUSolucao,
      gpuUsada: evento.gpuUsada,
      gpuUsadaUrgencia: evento.gpuUsadaUrgencia,
      gpuUsadaImpacto: evento.gpuUsadaImpacto,
      gpuUsadaSolucao: evento.gpuUsadaSolucao,
      gpuTemp: evento.gpuTemp,
      gpuTempUrgencia: evento.gpuTempUrgencia,
      gpuTempImpacto: evento.gpuTempImpacto,
      gpuTempSolucao: evento.gpuTempSolucao,
      gpuMemUsada: evento.gpuMemUsada,
      gpuMemUsadaUrgencia: evento.gpuMemUsadaUrgencia,
      gpuMemUsadaImpacto: evento.gpuMemUsadaImpacto,
      gpuMemUsadaSolucao: evento.gpuMemUsadaSolucao
    }
  end
end
