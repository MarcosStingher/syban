defmodule SybanPnxWeb.DadoControllerTest do
  use SybanPnxWeb.ConnCase

  import SybanPnx.MonitoramentoFixtures

  alias SybanPnx.Monitoramento.Dado

  @create_attrs %{
    datahora: ~U[2024-06-09 22:26:00Z],
    idmaquina: 1,
    memRamTotal: "120.5",
    memRamUsada: "120.5",
    memPercentual: "120.5",
    discoTotal: "120.5",
    discoUsado: "120.5",
    discoPercentual: "120.5",
    cpuPercentual: "120.5",
    processLogico: 42,
    processFisico: 42,
    freqCPU: "120.5",
    gpuNome: "some GPUNome",
    gpuUsada: "120.5",
    gpuTemp: "120.5",
    gpuMemTot: "120.5",
    gpuMemUsada: "120.5",
    gpuemLivre: "120.5",
    idevento: 1
  }
  @update_attrs %{
    datahora: ~U[2024-06-10 22:26:00Z],
    idmaquina: 1,
    memRamTotal: "456.7",
    memRamUsada: "456.7",
    memPercentual: "456.7",
    discoTotal: "456.7",
    discoUsado: "456.7",
    discoPercentual: "456.7",
    cpuPercentual: "456.7",
    processLogico: 43,
    processFisico: 43,
    freqCPU: "456.7",
    gpuNome: "some updated GPUNome",
    gpuUsada: "456.7",
    gpuTemp: "456.7",
    gpuMemTot: "456.7",
    gpuMemUsada: "456.7",
    gpuMemLivre: "456.7",
    idevento: 1
  }
  @invalid_attrs %{datahora: nil, idmaquina: nil, memRamTotal: nil, memRamUsada: nil, memPercentual: nil, discoTotal: nil, discousado: nil, discoPercentual: nil, cpuPercentual: nil, processLogico: nil, processFisico: nil, freqCPU: nil, gpuNome: nil, gpuUsada: nil, gpuTemp: nil, gpuMemTot: nil, gpuMemUsada: nil, gpuMemLivre: nil, idevento: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all monitoramento", %{conn: conn} do
      conn = get(conn, ~p"/api/monitoramento")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create dado" do
    test "renders dado when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/monitoramento", dado: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/monitoramento/#{id}")

      assert %{
               "id" => ^id,
               "CPUPercentual" => "120.5",
               "DiscoPercentual" => "120.5",
               "DiscoTotal" => "120.5",
               "Discousado" => "120.5",
               "FreqCPU" => "120.5",
               "GPUMemLivre" => "120.5",
               "GPUMemTot" => "120.5",
               "GPUMemUsada" => "120.5",
               "GPUNome" => "some GPUNome",
               "GPUTemp" => "120.5",
               "GPUUsada" => "120.5",
               "MemPercentual" => "120.5",
               "MemRamTotal" => "120.5",
               "MemRamUsada" => "120.5",
               "ProcessFisico" => 42,
               "ProcessLogico" => 42,
               "datahora" => "2024-06-09T22:26:00Z",
               "idmaquina" => 1,
               "idevento" => 1
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/monitoramento", dado: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update dado" do
    setup [:create_dado]

    test "renders dado when data is valid", %{conn: conn, dado: %Dado{id: id} = dado} do
      conn = put(conn, ~p"/api/monitoramento/#{dado}", dado: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/monitoramento/#{id}")

      assert %{
               "id" => ^id,
               "CPUPercentual" => "456.7",
               "DiscoPercentual" => "456.7",
               "DiscoTotal" => "456.7",
               "Discousado" => "456.7",
               "FreqCPU" => "456.7",
               "GPUMemLivre" => "456.7",
               "GPUMemTot" => "456.7",
               "GPUMemUsada" => "456.7",
               "GPUNome" => "some updated GPUNome",
               "GPUTemp" => "456.7",
               "GPUUsada" => "456.7",
               "MemPercentual" => "456.7",
               "MemRamTotal" => "456.7",
               "MemRamUsada" => "456.7",
               "ProcessFisico" => 43,
               "ProcessLogico" => 43,
               "datahora" => "2024-06-10T22:26:00Z",
               "idmaquina" => 2,
               "idevento" => 1
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, dado: dado} do
      conn = put(conn, ~p"/api/monitoramento/#{dado}", dado: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete dado" do
    setup [:create_dado]

    test "deletes chosen dado", %{conn: conn, dado: dado} do
      conn = delete(conn, ~p"/api/monitoramento/#{dado}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/monitoramento/#{dado}")
      end
    end
  end

  defp create_dado(_) do
    dado = dado_fixture()
    %{dado: dado}
  end
end
