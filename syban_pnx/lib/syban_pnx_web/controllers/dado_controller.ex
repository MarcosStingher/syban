defmodule SybanPnxWeb.DadoController do
  use SybanPnxWeb, :controller

  alias SybanPnx.Monitoramento
  alias SybanPnx.Monitoramento.Dado

  action_fallback SybanPnxWeb.FallbackController

  def index(conn, _params) do
    monitoramento = Monitoramento.list_monitoramento()
    render(conn, :index, monitoramento: monitoramento)
  end

  def create(conn, %{"dado" => dado_params}) do
    with {:ok, %Dado{} = dado} <- Monitoramento.create_dado(dado_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/monitoramento/#{dado}")
      |> render(:show, dado: dado)
    end
  end

  def show(conn, %{"id" => id}) do
    dado = Monitoramento.get_dado!(id)
    render(conn, :show, dado: dado)
  end

  def update(conn, %{"id" => id, "dado" => dado_params}) do
    dado = Monitoramento.get_dado!(id)

    with {:ok, %Dado{} = dado} <- Monitoramento.update_dado(dado, dado_params) do
      render(conn, :show, dado: dado)
    end
  end

  def delete(conn, %{"id" => id}) do
    dado = Monitoramento.get_dado!(id)

    with {:ok, %Dado{}} <- Monitoramento.delete_dado(dado) do
      send_resp(conn, :no_content, "")
    end
  end
end
