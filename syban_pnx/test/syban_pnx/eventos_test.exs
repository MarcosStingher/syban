defmodule SybanPnx.EventosTest do
  use SybanPnx.DataCase

  alias SybanPnx.Eventos

  describe "eventos" do
    alias SybanPnx.Eventos.Evento

    import SybanPnx.EventosFixtures

    @invalid_attrs %{discoUsadoImpacto: nil, cpuPercentual: nil, freqCPUUrgencia: nil, discoPercentualImpacto: nil, gpuMemUsadaImpacto: nil, memPercentualImpacto: nil, memRamUsadaImpacto: nil, processLogicoImpacto: nil, processFisicoImpacto: nil, memRamUsada: nil, discoPercentual: nil, gpuUsadaUrgencia: nil, discoUsadoUrgencia: nil, gpuMemUsadaUrgencia: nil, gpuUsada: nil, memPercentualUrgencia: nil, discoPercentualUrgencia: nil, processLogico: nil, memPercentual: nil, discoUsado: nil, gpuTemp: nil, processLogicoUrgencia: nil, gpuMemUsada: nil, memRamUsadaUrgencia: nil, cpuPercentualUrgencia: nil, freqCPU: nil, cpuPercentualImpacto: nil, processFisico: nil, gpuTempUrgencia: nil, gpuTempImpacto: nil, gpuUsadaImpacto: nil, processFisicoUrgencia: nil, freqCPUImpacto: nil}

    test "list_eventos/0 returns all eventos" do
      evento = evento_fixture()
      assert Eventos.list_eventos() == [evento]
    end

    test "get_evento!/1 returns the evento with given id" do
      evento = evento_fixture()
      assert Eventos.get_evento!(evento.id) == evento
    end

    test "create_evento/1 with valid data creates a evento" do
      valid_attrs = %{discoUsadoImpacto: 42, cpuPercentual: "some cpuPercentual", freqCPUUrgencia: 42, discoPercentualImpacto: 42, gpuMemUsadaImpacto: 42, memPercentualImpacto: 42, memRamUsadaImpacto: 42, processLogicoImpacto: 42, processFisicoImpacto: 42, memRamUsada: "some memRamUsada", discoPercentual: "some discoPercentual", gpuUsadaUrgencia: 42, discoUsadoUrgencia: 42, gpuMemUsadaUrgencia: 42, gpuUsada: "some gpuUsada", memPercentualUrgencia: 42, discoPercentualUrgencia: 42, processLogico: "some processLogico", memPercentual: "some memPercentual", discoUsado: "some discoUsado", gpuTemp: "some gpuTemp", processLogicoUrgencia: 42, gpuMemUsada: "some gpuMemUsada", memRamUsadaUrgencia: 42, cpuPercentualUrgencia: 42, freqCPU: "some freqCPU", cpuPercentualImpacto: 42, processFisico: "some processFisico", gpuTempUrgencia: 42, gpuTempImpacto: 42, gpuUsadaImpacto: 42, processFisicoUrgencia: 42, freqCPUImpacto: 42}

      assert {:ok, %Evento{} = evento} = Eventos.create_evento(valid_attrs)
      assert evento.freqCPUImpacto == 42
      assert evento.processFisicoUrgencia == 42
      assert evento.gpuUsadaImpacto == 42
      assert evento.gpuTempImpacto == 42
      assert evento.gpuTempUrgencia == 42
      assert evento.processFisico == "some processFisico"
      assert evento.cpuPercentualImpacto == 42
      assert evento.freqCPU == "some freqCPU"
      assert evento.cpuPercentualUrgencia == 42
      assert evento.memRamUsadaUrgencia == 42
      assert evento.gpuMemUsada == "some gpuMemUsada"
      assert evento.processLogicoUrgencia == 42
      assert evento.gpuTemp == "some gpuTemp"
      assert evento.discoUsado == "some discoUsado"
      assert evento.memPercentual == "some memPercentual"
      assert evento.processLogico == "some processLogico"
      assert evento.discoPercentualUrgencia == 42
      assert evento.memPercentualUrgencia == 42
      assert evento.gpuUsada == "some gpuUsada"
      assert evento.gpuMemUsadaUrgencia == 42
      assert evento.discoUsadoUrgencia == 42
      assert evento.gpuUsadaUrgencia == 42
      assert evento.discoPercentual == "some discoPercentual"
      assert evento.memRamUsada == "some memRamUsada"
      assert evento.processFisicoImpacto == 42
      assert evento.processLogicoImpacto == 42
      assert evento.memRamUsadaImpacto == 42
      assert evento.memPercentualImpacto == 42
      assert evento.gpuMemUsadaImpacto == 42
      assert evento.discoPercentualImpacto == 42
      assert evento.freqCPUUrgencia == 42
      assert evento.cpuPercentual == "some cpuPercentual"
      assert evento.discoUsadoImpacto == 42
    end

    test "create_evento/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Eventos.create_evento(@invalid_attrs)
    end

    test "update_evento/2 with valid data updates the evento" do
      evento = evento_fixture()
      update_attrs = %{discoUsadoImpacto: 43, cpuPercentual: "some updated cpuPercentual", freqCPUUrgencia: 43, discoPercentualImpacto: 43, gpuMemUsadaImpacto: 43, memPercentualImpacto: 43, memRamUsadaImpacto: 43, processLogicoImpacto: 43, processFisicoImpacto: 43, memRamUsada: "some updated memRamUsada", discoPercentual: "some updated discoPercentual", gpuUsadaUrgencia: 43, discoUsadoUrgencia: 43, gpuMemUsadaUrgencia: 43, gpuUsada: "some updated gpuUsada", memPercentualUrgencia: 43, discoPercentualUrgencia: 43, processLogico: "some updated processLogico", memPercentual: "some updated memPercentual", discoUsado: "some updated discoUsado", gpuTemp: "some updated gpuTemp", processLogicoUrgencia: 43, gpuMemUsada: "some updated gpuMemUsada", memRamUsadaUrgencia: 43, cpuPercentualUrgencia: 43, freqCPU: "some updated freqCPU", cpuPercentualImpacto: 43, processFisico: "some updated processFisico", gpuTempUrgencia: 43, gpuTempImpacto: 43, gpuUsadaImpacto: 43, processFisicoUrgencia: 43, freqCPUImpacto: 43}

      assert {:ok, %Evento{} = evento} = Eventos.update_evento(evento, update_attrs)
      assert evento.freqCPUImpacto == 43
      assert evento.processFisicoUrgencia == 43
      assert evento.gpuUsadaImpacto == 43
      assert evento.gpuTempImpacto == 43
      assert evento.gpuTempUrgencia == 43
      assert evento.processFisico == "some updated processFisico"
      assert evento.cpuPercentualImpacto == 43
      assert evento.freqCPU == "some updated freqCPU"
      assert evento.cpuPercentualUrgencia == 43
      assert evento.memRamUsadaUrgencia == 43
      assert evento.gpuMemUsada == "some updated gpuMemUsada"
      assert evento.processLogicoUrgencia == 43
      assert evento.gpuTemp == "some updated gpuTemp"
      assert evento.discoUsado == "some updated discoUsado"
      assert evento.memPercentual == "some updated memPercentual"
      assert evento.processLogico == "some updated processLogico"
      assert evento.discoPercentualUrgencia == 43
      assert evento.memPercentualUrgencia == 43
      assert evento.gpuUsada == "some updated gpuUsada"
      assert evento.gpuMemUsadaUrgencia == 43
      assert evento.discoUsadoUrgencia == 43
      assert evento.gpuUsadaUrgencia == 43
      assert evento.discoPercentual == "some updated discoPercentual"
      assert evento.memRamUsada == "some updated memRamUsada"
      assert evento.processFisicoImpacto == 43
      assert evento.processLogicoImpacto == 43
      assert evento.memRamUsadaImpacto == 43
      assert evento.memPercentualImpacto == 43
      assert evento.gpuMemUsadaImpacto == 43
      assert evento.discoPercentualImpacto == 43
      assert evento.freqCPUUrgencia == 43
      assert evento.cpuPercentual == "some updated cpuPercentual"
      assert evento.discoUsadoImpacto == 43
    end

    test "update_evento/2 with invalid data returns error changeset" do
      evento = evento_fixture()
      assert {:error, %Ecto.Changeset{}} = Eventos.update_evento(evento, @invalid_attrs)
      assert evento == Eventos.get_evento!(evento.id)
    end

    test "delete_evento/1 deletes the evento" do
      evento = evento_fixture()
      assert {:ok, %Evento{}} = Eventos.delete_evento(evento)
      assert_raise Ecto.NoResultsError, fn -> Eventos.get_evento!(evento.id) end
    end

    test "change_evento/1 returns a evento changeset" do
      evento = evento_fixture()
      assert %Ecto.Changeset{} = Eventos.change_evento(evento)
    end
  end
end
