defmodule SybanPnxWeb.TesteControllerTest do
  use SybanPnxWeb.ConnCase

  import SybanPnx.TestesFixtures

  alias SybanPnx.Testes.Teste

  @create_attrs %{
    nome: "some nome",
    email: "some email",
    senha: "some senha"
  }
  @update_attrs %{
    nome: "some updated nome",
    email: "some updated email",
    senha: "some updated senha"
  }
  @invalid_attrs %{nome: nil, email: nil, senha: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all teste", %{conn: conn} do
      conn = get(conn, ~p"/api/teste")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create teste" do
    test "renders teste when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/teste", teste: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/teste/#{id}")

      assert %{
               "id" => ^id,
               "email" => "some email",
               "nome" => "some nome",
               "senha" => "some senha"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/teste", teste: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update teste" do
    setup [:create_teste]

    test "renders teste when data is valid", %{conn: conn, teste: %Teste{id: id} = teste} do
      conn = put(conn, ~p"/api/teste/#{teste}", teste: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/teste/#{id}")

      assert %{
               "id" => ^id,
               "email" => "some updated email",
               "nome" => "some updated nome",
               "senha" => "some updated senha"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, teste: teste} do
      conn = put(conn, ~p"/api/teste/#{teste}", teste: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete teste" do
    setup [:create_teste]

    test "deletes chosen teste", %{conn: conn, teste: teste} do
      conn = delete(conn, ~p"/api/teste/#{teste}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/teste/#{teste}")
      end
    end
  end

  defp create_teste(_) do
    teste = teste_fixture()
    %{teste: teste}
  end
end
