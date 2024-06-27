defmodule SybanPnxWeb.EventoController do
  use SybanPnxWeb, :controller

  alias SybanPnx.Monitoramento
  alias SybanPnx.Monitoramento.Evento

  def index(conn, _params) do
    eventos = Monitoramento.list_eventos()
    render(conn, :index, eventos: eventos)
  end

  def new(conn, _params) do
    changeset = Monitoramento.change_evento(%Evento{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"evento" => evento_params}) do
    case Monitoramento.create_evento(evento_params) do
      {:ok, evento} ->
        conn
        |> put_flash(:info, "Evento created successfully.")
        |> redirect(to: ~p"/eventos/#{evento}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    evento = Monitoramento.get_evento!(id)
    render(conn, :show, evento: evento)
  end

  def edit(conn, %{"id" => id}) do
    evento = Monitoramento.get_evento!(id)
    changeset = Monitoramento.change_evento(evento)
    render(conn, :edit, evento: evento, changeset: changeset)
  end

  def update(conn, %{"id" => id, "evento" => evento_params}) do
    evento = Monitoramento.get_evento!(id)

    case Monitoramento.update_evento(evento, evento_params) do
      {:ok, evento} ->
        conn
        |> put_flash(:info, "Evento updated successfully.")
        |> redirect(to: ~p"/eventos/#{evento}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, evento: evento, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    evento = Monitoramento.get_evento!(id)
    {:ok, _evento} = Monitoramento.delete_evento(evento)

    conn
    |> put_flash(:info, "Evento deleted successfully.")
    |> redirect(to: ~p"/eventos")
  end
end
