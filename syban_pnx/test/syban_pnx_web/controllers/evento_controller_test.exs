defmodule SybanPnxWeb.EventoControllerTest do
  use SybanPnxWeb.ConnCase

  import SybanPnx.MonitoramentoFixtures

  @create_attrs %{icvinculada: "cpuPercentual", evento: "some evento", urgencia: 42, impacto: 42}
  @update_attrs %{icvinculada: "cpuPercentual", evento: "some updated evento", urgencia: 43, impacto: 43}
  @invalid_attrs %{icvinculada: nil, evento: nil, urgencia: nil, impacto: nil}

  describe "index" do
    test "lists all eventos", %{conn: conn} do
      conn = get(conn, ~p"/eventos")
      assert html_response(conn, 200) =~ "Listando Eventos"
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
      assert html_response(conn, 200) =~ "some updated evento"
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
