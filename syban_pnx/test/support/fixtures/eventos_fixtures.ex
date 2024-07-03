defmodule SybanPnx.EventosFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `SybanPnx.Eventos` context.
  """

  @doc """
  Generate a evento.
  """
  def evento_fixture(attrs \\ %{}) do
    {:ok, evento} =
      attrs
      |> Enum.into(%{
        memRamUsada: "some memRamUsada",
        memRamUsadaUrgencia: 42,
        memRamUsadaImpacto: 42,
        memRamUsadaSolucao: "some memRamUsadaSolucao",
        memPercentual: "some memPercentual",
        memPercentualUrgencia: 42,
        memPercentualImpacto: 42,
        memPercentualSolucao: "some memPercentualSolucao",
        discoUsado: "some discoUsado",
        discoUsadoUrgencia: 42,
        discoUsadoImpacto: 42,
        discoUsadoSolucao: "some discoUsadoSolucao",
        discoPercentual: "some discoPercentual",
        discoPercentualUrgencia: 42,
        discoPercentualImpacto: 42,
        discoPercentualSolucao: "some discoPercentualSolucao",
        cpuPercentual: "some cpuPercentual",
        cpuPercentualUrgencia: 42,
        cpuPercentualImpacto: 42,
        cpuPercentualSolucao: "some cpuPercentualSolucao",
        processLogico: "some processLogico",
        processLogicoUrgencia: 42,
        processLogicoImpacto: 42,
        processLogicoSolucao: "some processLogicoSolucao",
        processFisico: "some processFisico",
        processFisicoUrgencia: 42,
        processFisicoImpacto: 42,
        processFisicoSolucao: "some processFisicoSolucao",
        freqCPU: "some freqCPU",
        freqCPUUrgencia: 42,
        freqCPUImpacto: 42,
        freqCPUSolucao: "some freqCPUSolucao",
        gpuUsada: "some gpuUsada",
        gpuUsadaUrgencia: 42,
        gpuUsadaImpacto: 42,
        gpuUsadaSolucao: "some gpuUsadaSolucao",
        gpuTemp: "some gpuTemp",
        gpuTempUrgencia: 42,
        gpuTempImpacto: 42,
        gpuTempSolucao: "some gpuTempSolucao",
        gpuMemUsada: "some gpuMemUsada",
        gpuMemUsadaUrgencia: 42,
        gpuMemUsadaImpacto: 42,
        gpuMemUsadaSolucao: "some gpuMemUsadaSolucao"
      })
      |> SybanPnx.Eventos.create_evento()

    evento
  end
end
