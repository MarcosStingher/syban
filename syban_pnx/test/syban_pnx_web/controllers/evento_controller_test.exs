defmodule SybanPnxWeb.EventoControllerTest do
  use SybanPnxWeb.ConnCase

  import SybanPnx.EventosFixtures

  @create_attrs %{discoUsadoImpacto: 42, cpuPercentual: "some cpuPercentual", freqCPUUrgencia: 42, discoPercentualImpacto: 42, gpuMemUsadaImpacto: 42, memPercentualImpacto: 42, memRamUsadaImpacto: 42, processLogicoImpacto: 42, processFisicoImpacto: 42, memRamUsada: "some memRamUsada", discoPercentual: "some discoPercentual", gpuUsadaUrgencia: 42, discoUsadoUrgencia: 42, gpuMemUsadaUrgencia: 42, gpuUsada: "some gpuUsada", memPercentualUrgencia: 42, discoPercentualUrgencia: 42, processLogico: "some processLogico", memPercentual: "some memPercentual", discoUsado: "some discoUsado", gpuTemp: "some gpuTemp", processLogicoUrgencia: 42, gpuMemUsada: "some gpuMemUsada", memRamUsadaUrgencia: 42, cpuPercentualUrgencia: 42, freqCPU: "some freqCPU", cpuPercentualImpacto: 42, processFisico: "some processFisico", gpuTempUrgencia: 42, gpuTempImpacto: 42, gpuUsadaImpacto: 42, processFisicoUrgencia: 42, freqCPUImpacto: 42}
  @update_attrs %{discoUsadoImpacto: 43, cpuPercentual: "some updated cpuPercentual", freqCPUUrgencia: 43, discoPercentualImpacto: 43, gpuMemUsadaImpacto: 43, memPercentualImpacto: 43, memRamUsadaImpacto: 43, processLogicoImpacto: 43, processFisicoImpacto: 43, memRamUsada: "some updated memRamUsada", discoPercentual: "some updated discoPercentual", gpuUsadaUrgencia: 43, discoUsadoUrgencia: 43, gpuMemUsadaUrgencia: 43, gpuUsada: "some updated gpuUsada", memPercentualUrgencia: 43, discoPercentualUrgencia: 43, processLogico: "some updated processLogico", memPercentual: "some updated memPercentual", discoUsado: "some updated discoUsado", gpuTemp: "some updated gpuTemp", processLogicoUrgencia: 43, gpuMemUsada: "some updated gpuMemUsada", memRamUsadaUrgencia: 43, cpuPercentualUrgencia: 43, freqCPU: "some updated freqCPU", cpuPercentualImpacto: 43, processFisico: "some updated processFisico", gpuTempUrgencia: 43, gpuTempImpacto: 43, gpuUsadaImpacto: 43, processFisicoUrgencia: 43, freqCPUImpacto: 43}
  @invalid_attrs %{discoUsadoImpacto: nil, cpuPercentual: nil, freqCPUUrgencia: nil, discoPercentualImpacto: nil, gpuMemUsadaImpacto: nil, memPercentualImpacto: nil, memRamUsadaImpacto: nil, processLogicoImpacto: nil, processFisicoImpacto: nil, memRamUsada: nil, discoPercentual: nil, gpuUsadaUrgencia: nil, discoUsadoUrgencia: nil, gpuMemUsadaUrgencia: nil, gpuUsada: nil, memPercentualUrgencia: nil, discoPercentualUrgencia: nil, processLogico: nil, memPercentual: nil, discoUsado: nil, gpuTemp: nil, processLogicoUrgencia: nil, gpuMemUsada: nil, memRamUsadaUrgencia: nil, cpuPercentualUrgencia: nil, freqCPU: nil, cpuPercentualImpacto: nil, processFisico: nil, gpuTempUrgencia: nil, gpuTempImpacto: nil, gpuUsadaImpacto: nil, processFisicoUrgencia: nil, freqCPUImpacto: nil}

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
