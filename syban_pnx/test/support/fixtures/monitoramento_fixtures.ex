defmodule SybanPnx.MonitoramentoFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `SybanPnx.Monitoramento` context.
  """

  @doc """
  Generate a dado.
  """
  def dado_fixture(attrs \\ %{}) do
    {:ok, dado} =
      attrs
      |> Enum.into(%{
        cpuPercentual: "120.5",
        discoPercentual: "120.5",
        discoTotal: "120.5",
        discoUsado: "120.5",
        freqCPU: "120.5",
        gpuMemLivre: "120.5",
        gpuMemTot: "120.5",
        gpuMemUsada: "120.5",
        gpuNome: "some GPUNome",
        gpuTemp: "120.5",
        gpuUsada: "120.5",
        memPercentual: "120.5",
        memRamTotal: "120.5",
        memRamUsada: "120.5",
        processFisico: 42,
        processLogico: 42,
        datahora: ~U[2024-06-09 22:26:00Z],
        idmaquina: 1
      })
      |> SybanPnx.Monitoramento.create_dado()

    dado
  end

  @doc """
  Generate a evento.
  """
  def evento_fixture(attrs \\ %{}) do
    {:ok, evento} =
      attrs
      |> Enum.into(%{
        evento: "some evento",
        icvinculada: "cpuPercentual",
        impacto: 42,
        urgencia: 42
      })
      |> SybanPnx.Monitoramento.create_evento()

    evento
  end
end
