defmodule SybanPnxWeb.DadoJSON do
  alias SybanPnx.Monitoramento.Dado

  @doc """
  Renders a list of monitoramento.
  """
  def index(%{monitoramento: monitoramento}) do
    %{data: for(dado <- monitoramento, do: data(dado))}
  end

  @doc """
  Renders a single dado.
  """
  def show(%{dado: dado}) do
    %{data: data(dado)}
  end

  defp data(%Dado{} = dado) do
    %{
      id: dado.id,
      datahora: dado.datahora,
      idmaquina: dado.idmaquina,
      memRamTotal: dado.memRamTotal,
      memRamUsada: dado.memRamUsada,
      memPercentual: dado.memPercentual,
      discoTotal: dado.discoTotal,
      discoUsado: dado.discoUsado,
      discoPercentual: dado.discoPercentual,
      cpuPercentual: dado.cpuPercentual,
      processLogico: dado.processLogico,
      processFisico: dado.processFisico,
      freqCPU: dado.freqCPU,
      gpuNome: dado.gpuNome,
      gpuUsada: dado.gpuUsada,
      gpuTemp: dado.gpuTemp,
      gpuMemTot: dado.gpuMemTot,
      gpuMemUsada: dado.gpuMemUsada,
      gpuMemLivre: dado.gpuMemLivre
    }
  end
end
