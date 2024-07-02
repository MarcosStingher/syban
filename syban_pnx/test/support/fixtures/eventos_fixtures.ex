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
        cpuPercentual: "some cpuPercentual",
        cpuPercentualImpacto: 42,
        cpuPercentualUrgencia: 42,
        discoPercentual: "some discoPercentual",
        discoPercentualImpacto: 42,
        discoPercentualUrgencia: 42,
        discoUsado: "some discoUsado",
        discoUsadoImpacto: 42,
        discoUsadoUrgencia: 42,
        freqCPU: "some freqCPU",
        freqCPUImpacto: 42,
        freqCPUUrgencia: 42,
        gpuMemUsada: "some gpuMemUsada",
        gpuMemUsadaImpacto: 42,
        gpuMemUsadaUrgencia: 42,
        gpuTemp: "some gpuTemp",
        gpuTempImpacto: 42,
        gpuTempUrgencia: 42,
        gpuUsada: "some gpuUsada",
        gpuUsadaImpacto: 42,
        gpuUsadaUrgencia: 42,
        memPercentual: "some memPercentual",
        memPercentualImpacto: 42,
        memPercentualUrgencia: 42,
        memRamUsada: "some memRamUsada",
        memRamUsadaImpacto: 42,
        memRamUsadaUrgencia: 42,
        processFisico: "some processFisico",
        processFisicoImpacto: 42,
        processFisicoUrgencia: 42,
        processLogico: "some processLogico",
        processLogicoImpacto: 42,
        processLogicoUrgencia: 42
      })
      |> SybanPnx.Eventos.create_evento()

    evento
  end
end
