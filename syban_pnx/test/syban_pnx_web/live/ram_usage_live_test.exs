defmodule SybanPnxWeb.RAMUsageLiveTest do
  use SybanPnxWeb.ConnCase

  import Phoenix.LiveViewTest
  import SybanPnx.DashboardFixtures

  @create_attrs %{}
  @update_attrs %{}
  @invalid_attrs %{}

  defp create_ram_usage(_) do
    ram_usage = ram_usage_fixture()
    %{ram_usage: ram_usage}
  end

  describe "Index" do
    setup [:create_ram_usage]

    test "lists all ram_usages", %{conn: conn} do
      {:ok, _index_live, html} = live(conn, ~p"/ram_usages")

      assert html =~ "Listing Ram usages"
    end

    test "saves new ram_usage", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, ~p"/ram_usages")

      assert index_live |> element("a", "New Ram usage") |> render_click() =~
               "New Ram usage"

      assert_patch(index_live, ~p"/ram_usages/new")

      assert index_live
             |> form("#ram_usage-form", ram_usage: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#ram_usage-form", ram_usage: @create_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/ram_usages")

      html = render(index_live)
      assert html =~ "Ram usage created successfully"
    end

    test "updates ram_usage in listing", %{conn: conn, ram_usage: ram_usage} do
      {:ok, index_live, _html} = live(conn, ~p"/ram_usages")

      assert index_live |> element("#ram_usages-#{ram_usage.id} a", "Edit") |> render_click() =~
               "Edit Ram usage"

      assert_patch(index_live, ~p"/ram_usages/#{ram_usage}/edit")

      assert index_live
             |> form("#ram_usage-form", ram_usage: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#ram_usage-form", ram_usage: @update_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/ram_usages")

      html = render(index_live)
      assert html =~ "Ram usage updated successfully"
    end

    test "deletes ram_usage in listing", %{conn: conn, ram_usage: ram_usage} do
      {:ok, index_live, _html} = live(conn, ~p"/ram_usages")

      assert index_live |> element("#ram_usages-#{ram_usage.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#ram_usages-#{ram_usage.id}")
    end
  end

  describe "Show" do
    setup [:create_ram_usage]

    test "displays ram_usage", %{conn: conn, ram_usage: ram_usage} do
      {:ok, _show_live, html} = live(conn, ~p"/ram_usages/#{ram_usage}")

      assert html =~ "Show Ram usage"
    end

    test "updates ram_usage within modal", %{conn: conn, ram_usage: ram_usage} do
      {:ok, show_live, _html} = live(conn, ~p"/ram_usages/#{ram_usage}")

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Ram usage"

      assert_patch(show_live, ~p"/ram_usages/#{ram_usage}/show/edit")

      assert show_live
             |> form("#ram_usage-form", ram_usage: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert show_live
             |> form("#ram_usage-form", ram_usage: @update_attrs)
             |> render_submit()

      assert_patch(show_live, ~p"/ram_usages/#{ram_usage}")

      html = render(show_live)
      assert html =~ "Ram usage updated successfully"
    end
  end
end
