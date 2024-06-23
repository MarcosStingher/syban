defmodule SybanPnxWeb.DispositivoControllerTest do
  use SybanPnxWeb.ConnCase

  import SybanPnx.DispositivosFixtures

  @create_attrs %{nomedispositivo: "some nomedispositivo"}
  @update_attrs %{nomedispositivo: "some updated nomedispositivo"}
  @invalid_attrs %{nomedispositivo: nil}

  describe "index" do
    test "lists all dispositivo", %{conn: conn} do
      conn = get(conn, ~p"/dispositivo")
      assert html_response(conn, 200) =~ "Listing Dispositivo"
    end
  end

  describe "new dispositivo" do
    test "renders form", %{conn: conn} do
      conn = get(conn, ~p"/dispositivo/new")
      assert html_response(conn, 200) =~ "New Dispositivo"
    end
  end

  describe "create dispositivo" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/dispositivo", dispositivo: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/dispositivo/#{id}"

      conn = get(conn, ~p"/dispositivo/#{id}")
      assert html_response(conn, 200) =~ "Dispositivo #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/dispositivo", dispositivo: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Dispositivo"
    end
  end

  describe "edit dispositivo" do
    setup [:create_dispositivo]

    test "renders form for editing chosen dispositivo", %{conn: conn, dispositivo: dispositivo} do
      conn = get(conn, ~p"/dispositivo/#{dispositivo}/edit")
      assert html_response(conn, 200) =~ "Edit Dispositivo"
    end
  end

  describe "update dispositivo" do
    setup [:create_dispositivo]

    test "redirects when data is valid", %{conn: conn, dispositivo: dispositivo} do
      conn = put(conn, ~p"/dispositivo/#{dispositivo}", dispositivo: @update_attrs)
      assert redirected_to(conn) == ~p"/dispositivo/#{dispositivo}"

      conn = get(conn, ~p"/dispositivo/#{dispositivo}")
      assert html_response(conn, 200) =~ "some updated nomedispositivo"
    end

    test "renders errors when data is invalid", %{conn: conn, dispositivo: dispositivo} do
      conn = put(conn, ~p"/dispositivo/#{dispositivo}", dispositivo: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Dispositivo"
    end
  end

  describe "delete dispositivo" do
    setup [:create_dispositivo]

    test "deletes chosen dispositivo", %{conn: conn, dispositivo: dispositivo} do
      conn = delete(conn, ~p"/dispositivo/#{dispositivo}")
      assert redirected_to(conn) == ~p"/dispositivo"

      assert_error_sent 404, fn ->
        get(conn, ~p"/dispositivo/#{dispositivo}")
      end
    end
  end

  defp create_dispositivo(_) do
    dispositivo = dispositivo_fixture()
    %{dispositivo: dispositivo}
  end
end
