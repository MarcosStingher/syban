defmodule SybanPnxWeb.TesteController do
  use SybanPnxWeb, :controller

  alias SybanPnx.Testes
  alias SybanPnx.Testes.Teste

  action_fallback SybanPnxWeb.FallbackController

  def index(conn, _params) do
    teste = Testes.list_teste()
    render(conn, :index, teste: teste)
  end

  def create(conn, %{"teste" => teste_params}) do
    with {:ok, %Teste{} = teste} <- Testes.create_teste(teste_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/teste/#{teste}")
      |> render(:show, teste: teste)
    end
  end

  def show(conn, %{"id" => id}) do
    teste = Testes.get_teste!(id)
    render(conn, :show, teste: teste)
  end

  def update(conn, %{"id" => id, "teste" => teste_params}) do
    teste = Testes.get_teste!(id)

    with {:ok, %Teste{} = teste} <- Testes.update_teste(teste, teste_params) do
      render(conn, :show, teste: teste)
    end
  end

  def delete(conn, %{"id" => id}) do
    teste = Testes.get_teste!(id)

    with {:ok, %Teste{}} <- Testes.delete_teste(teste) do
      send_resp(conn, :no_content, "")
    end
  end
end
