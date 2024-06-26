defmodule SybanPnx.MonitoramentoTest do
  use SybanPnx.DataCase

  alias SybanPnx.Monitoramento

  describe "monitoramento" do
    alias SybanPnx.Monitoramento.Dado

    import SybanPnx.MonitoramentoFixtures

    @invalid_attrs %{datahora: nil, idmaquina: nil, memRamTotal: nil, memRamUsada: nil, memPercentual: nil, discoTotal: nil, discoUsado: nil, discoPercentual: nil, cpuPercentual: nil, processLogico: nil, processFisico: nil, freqCPU: nil, gpuNome: nil, gpuUsada: nil, gpuTemp: nil, gpuMemTot: nil, gpuMemUsada: nil, gpuMemLivre: nil, idevento: nil}

    test "list_monitoramento/0 returns all monitoramento" do
      dado = dado_fixture()
      assert Monitoramento.list_monitoramento() == [dado]
    end

    test "get_dado!/1 returns the dado with given id" do
      dado = dado_fixture()
      assert Monitoramento.get_dado!(dado.id) == dado
    end

    test "create_dado/1 with valid data creates a dado" do
      valid_attrs = %{datahora: ~U[2024-06-09 22:26:00Z], idmaquina: 1, memRamTotal: "120.5", memRamUsada: "120.5", memPercentual: "120.5", discoTotal: "120.5", discoUsado: "120.5", discoPercentual: "120.5", cpuPercentual: "120.5", processLogico: 42, processFisico: 42, freqCPU: "120.5", gpuNome: "some GPUNome", gpuUsada: "120.5", gpuTemp: "120.5", gpuMemTot: "120.5", gpuMemUsada: "120.5", gpuMemLivre: "120.5", idevento: 1}

      assert {:ok, %Dado{} = dado} = Monitoramento.create_dado(valid_attrs)
      assert dado.datahora == ~U[2024-06-09 22:26:00Z]
      assert dado.idmaquina == 1
      assert dado.memRamTotal == Decimal.new("120.5")
      assert dado.memRamUsada == Decimal.new("120.5")
      assert dado.memPercentual == Decimal.new("120.5")
      assert dado.discoTotal == Decimal.new("120.5")
      assert dado.discoUsado == Decimal.new("120.5")
      assert dado.discoPercentual == Decimal.new("120.5")
      assert dado.cpuPercentual == Decimal.new("120.5")
      assert dado.processLogico == 42
      assert dado.processFisico == 42
      assert dado.freqCPU == Decimal.new("120.5")
      assert dado.gpuNome == "some GPUNome"
      assert dado.gpuUsada == Decimal.new("120.5")
      assert dado.gpuTemp == Decimal.new("120.5")
      assert dado.gpuMemTot == Decimal.new("120.5")
      assert dado.gpuMemUsada == Decimal.new("120.5")
      assert dado.gpuMemLivre == Decimal.new("120.5")
      assert dado.idevento == 1
    end


    test "create_dado/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Monitoramento.create_dado(@invalid_attrs)
    end

    test "update_dado/2 with valid data updates the dado" do
      dado = dado_fixture()
      update_attrs = %{datahora: ~U[2024-06-10 22:26:00Z], idmaquina: 2, memRamTotal: "456.7", memRamUsada: "456.7", memPercentual: "456.7", discoTotal: "456.7", discousado: "456.7", discoPercentual: "456.7", cpuPercentual: "456.7", processLogico: 43, processFisico: 43, freqCPU: "456.7", gpuNome: "some updated GPUNome", gpuUsada: "456.7", gpuTemp: "456.7", gpuMemTot: "456.7", gpuMemUsada: "456.7", gpuMemLivre: "456.7", idevento: 1}

      assert {:ok, %Dado{} = dado} = Monitoramento.update_dado(dado, update_attrs)
      assert dado.datahora == ~U[2024-06-10 22:26:00Z]
      assert dado.idmaquina == 2
      assert dado.memRamTotal == Decimal.new("456.7")
      assert dado.memRamUsada == Decimal.new("456.7")
      assert dado.memPercentual == Decimal.new("456.7")
      assert dado.discoTotal == Decimal.new("456.7")
      assert dado.discoUsado == Decimal.new("456.7")
      assert dado.discoPercentual == Decimal.new("456.7")
      assert dado.cpuPercentual == Decimal.new("456.7")
      assert dado.processLogico == 43
      assert dado.processFisico == 43
      assert dado.freqCPU == Decimal.new("456.7")
      assert dado.gpuNome == "some updated GPUNome"
      assert dado.gpuUsada == Decimal.new("456.7")
      assert dado.gpuTemp == Decimal.new("456.7")
      assert dado.gpuMemTot == Decimal.new("456.7")
      assert dado.gpuMemUsada == Decimal.new("456.7")
      assert dado.gpuMemLivre == Decimal.new("456.7")
      assert dado.idevento == 1
    end

    test "update_dado/2 with invalid data returns error changeset" do
      dado = dado_fixture()
      assert {:error, %Ecto.Changeset{}} = Monitoramento.update_dado(dado, @invalid_attrs)
      assert dado == Monitoramento.get_dado!(dado.id)
    end

    test "delete_dado/1 deletes the dado" do
      dado = dado_fixture()
      assert {:ok, %Dado{}} = Monitoramento.delete_dado(dado)
      assert_raise Ecto.NoResultsError, fn -> Monitoramento.get_dado!(dado.id) end
    end

    test "change_dado/1 returns a dado changeset" do
      dado = dado_fixture()
      assert %Ecto.Changeset{} = Monitoramento.change_dado(dado)
    end
  end
end
