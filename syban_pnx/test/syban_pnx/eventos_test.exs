defmodule SybanPnx.EventosTest do
  use SybanPnx.DataCase

  alias SybanPnx.Eventos

  describe "eventos" do
    alias SybanPnx.Eventos.Evento

    import SybanPnx.EventosFixtures

    @invalid_attrs %{
      memRamUsada: nil, memRamUsadaUrgencia: nil, memRamUsadaImpacto: nil, memRamUsadaSolucao: nil,
      memPercentual: nil, memPercentualUrgencia: nil, memPercentualImpacto: nil, memPercentualSolucao: nil,
      discoUsado: nil, discoUsadoUrgencia: nil, discoUsadoImpacto: nil, discoUsadoSolucao: nil,
      discoPercentual: nil, discoPercentualUrgencia: nil, discoPercentualImpacto: nil, discoPercentualSolucao: nil,
      cpuPercentual: nil, cpuPercentualUrgencia: nil, cpuPercentualImpacto: nil, cpuPercentualSolucao: nil,
      processLogico: nil, processLogicoUrgencia: nil, processLogicoImpacto: nil, processLogicoSolucao: nil,
      processFisico: nil, processFisicoUrgencia: nil, processFisicoImpacto: nil, processFisicoSolucao: nil,
      freqCPU: nil, freqCPUUrgencia: nil, freqCPUImpacto: nil, freqCPUSolucao: nil,
      gpuUsada: nil, gpuUsadaUrgencia: nil, gpuUsadaImpacto: nil, gpuUsadaSolucao: nil,
      gpuTemp: nil, gpuTempUrgencia: nil, gpuTempImpacto: nil, gpuTempSolucao: nil,
      gpuMemUsada: nil, gpuMemUsadaUrgencia: nil, gpuMemUsadaImpacto: nil, gpuMemUsadaSolucao: nil
    }

    test "list_eventos/0 returns all eventos" do
      evento = evento_fixture()
      assert Eventos.list_eventos() == [evento]
    end

    test "get_evento!/1 returns the evento with given id" do
      evento = evento_fixture()
      assert Eventos.get_evento!(evento.id) == evento
    end

    test "create_evento/1 with valid data creates a evento" do
      valid_attrs = %{
        memRamUsada: "some memRamUsada", memRamUsadaUrgencia: 42, memRamUsadaImpacto: 42, memRamUsadaSolucao: "some memRamUsadaSolucao",
        memPercentual: "some memPercentual", memPercentualUrgencia: 42, memPercentualImpacto: 42, memPercentualSolucao: "some memPercentualSolucao",
        discoUsado: "some discoUsado", discoUsadoUrgencia: 42, discoUsadoImpacto: 42, discoUsadoSolucao: "some discoUsadoSolucao",
        discoPercentual: "some discoPercentual", discoPercentualUrgencia: 42, discoPercentualImpacto: 42, discoPercentualSolucao: "some discoPercentualSolucao",
        cpuPercentual: "some cpuPercentual", cpuPercentualUrgencia: 42, cpuPercentualImpacto: 42, cpuPercentualSolucao: "some cpuPercentualSolucao",
        processLogico: "some processLogico", processLogicoUrgencia: 42, processLogicoImpacto: 42, processLogicoSolucao: "some processLogicoSolucao",
        processFisico: "some processFisico", processFisicoUrgencia: 42, processFisicoImpacto: 42, processFisicoSolucao: "some processFisicoSolucao",
        freqCPU: "some freqCPU", freqCPUUrgencia: 42, freqCPUImpacto: 42, freqCPUSolucao: "some freqCPUSolucao",
        gpuUsada: "some gpuUsada", gpuUsadaUrgencia: 42, gpuUsadaImpacto: 42, gpuUsadaSolucao: "some gpuUsadaSolucao",
        gpuTemp: "some gpuTemp", gpuTempUrgencia: 42, gpuTempImpacto: 42, gpuTempSolucao: "some gpuTempSolucao",
        gpuMemUsada: "some gpuMemUsada", gpuMemUsadaUrgencia: 42, gpuMemUsadaImpacto: 42, gpuMemUsadaSolucao: "some gpuMemUsadaSolucao"
      }

      assert {:ok, %Evento{} = evento} = Eventos.create_evento(valid_attrs)
      assert evento.memRamUsada == "some memRamUsada"
      assert evento.memRamUsadaUrgencia == 42
      assert evento.memRamUsadaImpacto == 42
      assert evento.memRamUsadaSolucao == "some memRamUsadaSolucao"
      assert evento.memPercentual == "some memPercentual"
      assert evento.memPercentualUrgencia == 42
      assert evento.memPercentualImpacto == 42
      assert evento.memPercentualSolucao == "some memPercentualSolucao"
      assert evento.discoUsado == "some discoUsado"
      assert evento.discoUsadoUrgencia == 42
      assert evento.discoUsadoImpacto == 42
      assert evento.discoUsadoSolucao == "some discoUsadoSolucao"
      assert evento.discoPercentual == "some discoPercentual"
      assert evento.discoPercentualUrgencia == 42
      assert evento.discoPercentualImpacto == 42
      assert evento.discoPercentualSolucao == "some discoPercentualSolucao"
      assert evento.cpuPercentual == "some cpuPercentual"
      assert evento.cpuPercentualUrgencia == 42
      assert evento.cpuPercentualImpacto == 42
      assert evento.cpuPercentualSolucao == "some cpuPercentualSolucao"
      assert evento.processLogico == "some processLogico"
      assert evento.processLogicoUrgencia == 42
      assert evento.processLogicoImpacto == 42
      assert evento.processLogicoSolucao == "some processLogicoSolucao"
      assert evento.processFisico == "some processFisico"
      assert evento.processFisicoUrgencia == 42
      assert evento.processFisicoImpacto == 42
      assert evento.processFisicoSolucao == "some processFisicoSolucao"
      assert evento.freqCPU == "some freqCPU"
      assert evento.freqCPUUrgencia == 42
      assert evento.freqCPUImpacto == 42
      assert evento.freqCPUSolucao == "some freqCPUSolucao"
      assert evento.gpuUsada == "some gpuUsada"
      assert evento.gpuUsadaUrgencia == 42
      assert evento.gpuUsadaImpacto == 42
      assert evento.gpuUsadaSolucao == "some gpuUsadaSolucao"
      assert evento.gpuTemp == "some gpuTemp"
      assert evento.gpuTempUrgencia == 42
      assert evento.gpuTempImpacto == 42
      assert evento.gpuTempSolucao == "some gpuTempSolucao"
      assert evento.gpuMemUsada == "some gpuMemUsada"
      assert evento.gpuMemUsadaUrgencia == 42
      assert evento.gpuMemUsadaImpacto == 42
      assert evento.gpuMemUsadaSolucao == "some gpuMemUsadaSolucao"
    end

    test "create_evento/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Eventos.create_evento(@invalid_attrs)
    end

    test "update_evento/2 with valid data updates the evento" do
      evento = evento_fixture()
      update_attrs = %{
        memRamUsada: "some updated memRamUsada", memRamUsadaUrgencia: 43, memRamUsadaImpacto: 43, memRamUsadaSolucao: "some updated memRamUsadaSolucao",
        memPercentual: "some updated memPercentual", memPercentualUrgencia: 43, memPercentualImpacto: 43, memPercentualSolucao: "some updated memPercentualSolucao",
        discoUsado: "some updated discoUsado", discoUsadoUrgencia: 43, discoUsadoImpacto: 43, discoUsadoSolucao: "some updated discoUsadoSolucao",
        discoPercentual: "some updated discoPercentual", discoPercentualUrgencia: 43, discoPercentualImpacto: 43, discoPercentualSolucao: "some updated discoPercentualSolucao",
        cpuPercentual: "some updated cpuPercentual", cpuPercentualUrgencia: 43, cpuPercentualImpacto: 43, cpuPercentualSolucao: "some updated cpuPercentualSolucao",
        processLogico: "some updated processLogico", processLogicoUrgencia: 43, processLogicoImpacto: 43, processLogicoSolucao: "some updated processLogicoSolucao",
        processFisico: "some updated processFisico", processFisicoUrgencia: 43, processFisicoImpacto: 43, processFisicoSolucao: "some updated processFisicoSolucao",
        freqCPU: "some updated freqCPU", freqCPUUrgencia: 43, freqCPUImpacto: 43, freqCPUSolucao: "some updated freqCPUSolucao",
        gpuUsada: "some updated gpuUsada", gpuUsadaUrgencia: 43, gpuUsadaImpacto: 43, gpuUsadaSolucao: "some updated gpuUsadaSolucao",
        gpuTemp: "some updated gpuTemp", gpuTempUrgencia: 43, gpuTempImpacto: 43, gpuTempSolucao: "some updated gpuTempSolucao",
        gpuMemUsada: "some updated gpuMemUsada", gpuMemUsadaUrgencia: 43, gpuMemUsadaImpacto: 43, gpuMemUsadaSolucao: "some updated gpuMemUsadaSolucao"
      }

      assert {:ok, %Evento{} = evento} = Eventos.update_evento(evento, update_attrs)
      assert evento.memRamUsada == "some updated memRamUsada"
      assert evento.memRamUsadaUrgencia == 43
      assert evento.memRamUsadaImpacto == 43
      assert evento.memRamUsadaSolucao == "some updated memRamUsadaSolucao"
      assert evento.memPercentual == "some updated memPercentual"
      assert evento.memPercentualUrgencia == 43
      assert evento.memPercentualImpacto == 43
      assert evento.memPercentualSolucao == "some updated memPercentualSolucao"
      assert evento.discoUsado == "some updated discoUsado"
      assert evento.discoUsadoUrgencia == 43
      assert evento.discoUsadoImpacto == 43
      assert evento.discoUsadoSolucao == "some updated discoUsadoSolucao"
      assert evento.discoPercentual == "some updated discoPercentual"
      assert evento.discoPercentualUrgencia == 43
      assert evento.discoPercentualImpacto == 43
      assert evento.discoPercentualSolucao == "some updated discoPercentualSolucao"
      assert evento.cpuPercentual == "some updated cpuPercentual"
      assert evento.cpuPercentualUrgencia == 43
      assert evento.cpuPercentualImpacto == 43
      assert evento.cpuPercentualSolucao == "some updated cpuPercentualSolucao"
      assert evento.processLogico == "some updated processLogico"
      assert evento.processLogicoUrgencia == 43
      assert evento.processLogicoImpacto == 43
      assert evento.processLogicoSolucao == "some updated processLogicoSolucao"
      assert evento.processFisico == "some updated processFisico"
      assert evento.processFisicoUrgencia == 43
      assert evento.processFisicoImpacto == 43
      assert evento.processFisicoSolucao == "some updated processFisicoSolucao"
      assert evento.freqCPU == "some updated freqCPU"
      assert evento.freqCPUUrgencia == 43
      assert evento.freqCPUImpacto == 43
      assert evento.freqCPUSolucao == "some updated freqCPUSolucao"
      assert evento.gpuUsada == "some updated gpuUsada"
      assert evento.gpuUsadaUrgencia == 43
      assert evento.gpuUsadaImpacto == 43
      assert evento.gpuUsadaSolucao == "some updated gpuUsadaSolucao"
      assert evento.gpuTemp == "some updated gpuTemp"
      assert evento.gpuTempUrgencia == 43
      assert evento.gpuTempImpacto == 43
      assert evento.gpuTempSolucao == "some updated gpuTempSolucao"
      assert evento.gpuMemUsada == "some updated gpuMemUsada"
      assert evento.gpuMemUsadaUrgencia == 43
      assert evento.gpuMemUsadaImpacto == 43
      assert evento.gpuMemUsadaSolucao == "some updated gpuMemUsadaSolucao"
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
