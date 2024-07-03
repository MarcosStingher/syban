defmodule SybanPnxWeb.EventoControllerTest do
  use SybanPnxWeb.ConnCase

  import SybanPnx.EventosFixtures

  @create_attrs %{
    memRamUsada: "some memRamUsada", memRamUsadaUrgencia: 42, memRamUsadaImpacto: 42, memRamUsadaSolucao: "some memRamUsadaSolucao",   memPercentual: "some memPercentual", memPercentualUrgencia: 42, memPercentualImpacto: 42, memPercentualSolucao: "some memPercentualSolucao",    discoUsado: "some discoUsado", discoUsadoUrgencia: 42, discoUsadoImpacto: 42, discoUsadoSolucao: "some discoUsadoSolucao",   discoPercentual: "some discoPercentual", discoPercentualUrgencia: 42, discoPercentualImpacto: 42, discoPercentualSolucao: "some discoPercentualSolucao",    cpuPercentual: "some cpuPercentual", cpuPercentualUrgencia: 42, cpuPercentualImpacto: 42, cpuPercentualSolucao: "some cpuPercentualSolucao",    processLogico: "some processLogico", processLogicoUrgencia: 42, processLogicoImpacto: 42, processLogicoSolucao: "some processLogicoSolucao",    processFisico: "some processFisico", processFisicoUrgencia: 42, processFisicoImpacto: 42, processFisicoSolucao: "some processFisicoSolucao",    freqCPU: "some freqCPU", freqCPUUrgencia: 42, freqCPUImpacto: 42, freqCPUSolucao: "some freqCPUSolucao",    gpuUsada: "some gpuUsada", gpuUsadaUrgencia: 42, gpuUsadaImpacto: 42, gpuUsadaSolucao: "some gpuUsadaSolucao",    gpuTemp: "some gpuTemp", gpuTempUrgencia: 42, gpuTempImpacto: 42, gpuTempSolucao: "some gpuTempSolucao",    gpuMemUsada: "some gpuMemUsada", gpuMemUsadaUrgencia: 42, gpuMemUsadaImpacto: 42, gpuMemUsadaSolucao: "some gpuMemUsadaSolucao"
  }

  @update_attrs %{
    memRamUsada: "some updated memRamUsada", memRamUsadaUrgencia: 43, memRamUsadaImpacto: 43, memRamUsadaSolucao: "some updated memRamUsadaSolucao",    memPercentual: "some updated memPercentual", memPercentualUrgencia: 43, memPercentualImpacto: 43, memPercentualSolucao: "some updated memPercentualSolucao",    discoUsado: "some updated discoUsado", discoUsadoUrgencia: 43, discoUsadoImpacto: 43, discoUsadoSolucao: "some updated discoUsadoSolucao",    discoPercentual: "some updated discoPercentual", discoPercentualUrgencia: 43, discoPercentualImpacto: 43, discoPercentualSolucao: "some updated discoPercentualSolucao",    cpuPercentual: "some updated cpuPercentual", cpuPercentualUrgencia: 43, cpuPercentualImpacto: 43, cpuPercentualSolucao: "some updated cpuPercentualSolucao",    processLogico: "some updated processLogico", processLogicoUrgencia: 43, processLogicoImpacto: 43, processLogicoSolucao: "some updated processLogicoSolucao",    processFisico: "some updated processFisico", processFisicoUrgencia: 43, processFisicoImpacto: 43, processFisicoSolucao: "some updated processFisicoSolucao",    freqCPU: "some updated freqCPU", freqCPUUrgencia: 43, freqCPUImpacto: 43, freqCPUSolucao: "some updated freqCPUSolucao",    gpuUsada: "some updated gpuUsada", gpuUsadaUrgencia: 43, gpuUsadaImpacto: 43, gpuUsadaSolucao: "some updated gpuUsadaSolucao",    gpuTemp: "some updated gpuTemp", gpuTempUrgencia: 43, gpuTempImpacto: 43, gpuTempSolucao: "some updated gpuTempSolucao",    gpuMemUsada: "some updated gpuMemUsada", gpuMemUsadaUrgencia: 43, gpuMemUsadaImpacto: 43, gpuMemUsadaSolucao: "some updated gpuMemUsadaSolucao"
  }

  @invalid_attrs %{
    memRamUsada: nil, memRamUsadaUrgencia: nil, memRamUsadaImpacto: nil, memRamUsadaSolucao: nil,   memPercentual: nil, memPercentualUrgencia: nil, memPercentualImpacto: nil, memPercentualSolucao: nil,  discoUsado: nil, discoUsadoUrgencia: nil, discoUsadoImpacto: nil, discoUsadoSolucao: nil,  discoPercentual: nil, discoPercentualUrgencia: nil, discoPercentualImpacto: nil, discoPercentualSolucao: nil,    cpuPercentual: nil, cpuPercentualUrgencia: nil, cpuPercentualImpacto: nil, cpuPercentualSolucao: nil,   processLogico: nil, processLogicoUrgencia: nil, processLogicoImpacto: nil, processLogicoSolucao: nil,    processFisico: nil, processFisicoUrgencia: nil, processFisicoImpacto: nil, processFisicoSolucao: nil, freqCPU: nil, freqCPUUrgencia: nil, freqCPUImpacto: nil, freqCPUSolucao: nil, gpuUsada: nil, gpuUsadaUrgencia: nil, gpuUsadaImpacto: nil, gpuUsadaSolucao: nil, gpuTemp: nil, gpuTempUrgencia: nil, gpuTempImpacto: nil, gpuTempSolucao: nil, gpuMemUsada: nil, gpuMemUsadaUrgencia: nil, gpuMemUsadaImpacto: nil, gpuMemUsadaSolucao: nil
  }

  describe "index" do
    test "lists all eventos", %{conn: conn} do
      conn = get(conn, ~p"/eventos")
      assert html_response(conn, 200) =~ "Listing Eventos"
    end
  end

  describe "new evento" do
    test "renders form", %{conn: conn} do
      conn = get(conn, ~p"/eventos/new")
      assert html_response(conn, 200) =~ "New Evento"
    end
  end

  describe "create evento" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/eventos", evento: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/eventos/#{id}"

      conn = get(conn, ~p"/eventos/#{id}")
      assert html_response(conn, 200) =~ "Evento #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/eventos", evento: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Evento"
    end
  end

  describe "edit evento" do
    setup [:create_evento]

    test "renders form for editing chosen evento", %{conn: conn, evento: evento} do
      conn = get(conn, ~p"/eventos/#{evento}/edit")
      assert html_response(conn, 200) =~ "Edit Evento"
    end
  end

  describe "update evento" do
    setup [:create_evento]

    test "redirects when data is valid", %{conn: conn, evento: evento} do
      conn = put(conn, ~p"/eventos/#{evento}", evento: @update_attrs)
      assert redirected_to(conn) == ~p"/eventos/#{evento}"

      conn = get(conn, ~p"/eventos/#{evento}")
      assert html_response(conn, 200) =~ "some updated cpuPercentual"
    end

    test "renders errors when data is invalid", %{conn: conn, evento: evento} do
      conn = put(conn, ~p"/eventos/#{evento}", evento: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Evento"
    end
  end

  describe "delete evento" do
    setup [:create_evento]

    test "deletes chosen evento", %{conn: conn, evento: evento} do
      conn = delete(conn, ~p"/eventos/#{evento}")
      assert redirected_to(conn) == ~p"/eventos"

      assert_error_sent 404, fn ->
        get(conn, ~p"/eventos/#{evento}")
      end
    end
  end

  defp create_evento(_) do
    evento = evento_fixture()
    %{evento: evento}
  end
end
