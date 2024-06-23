defmodule SybanPnxWeb.DispositivoController do
  use SybanPnxWeb, :controller

  alias SybanPnx.Dispositivos
  alias SybanPnx.Dispositivos.Dispositivo

  def index(conn, _params) do
    dispositivo = Dispositivos.list_dispositivo()
    render(conn, :index, dispositivo_collection: dispositivo)
  end

  def new(conn, _params) do
    changeset = Dispositivos.change_dispositivo(%Dispositivo{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"dispositivo" => dispositivo_params}) do
    case Dispositivos.create_dispositivo(dispositivo_params) do
      {:ok, dispositivo} ->
        conn
        |> put_flash(:info, "Dispositivo created successfully.")
        |> redirect(to: ~p"/dispositivo/#{dispositivo}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    dispositivo = Dispositivos.get_dispositivo!(id)
    render(conn, :show, dispositivo: dispositivo)
  end

  def edit(conn, %{"id" => id}) do
    dispositivo = Dispositivos.get_dispositivo!(id)
    changeset = Dispositivos.change_dispositivo(dispositivo)
    render(conn, :edit, dispositivo: dispositivo, changeset: changeset)
  end

  def update(conn, %{"id" => id, "dispositivo" => dispositivo_params}) do
    dispositivo = Dispositivos.get_dispositivo!(id)

    case Dispositivos.update_dispositivo(dispositivo, dispositivo_params) do
      {:ok, dispositivo} ->
        conn
        |> put_flash(:info, "Dispositivo updated successfully.")
        |> redirect(to: ~p"/dispositivo/#{dispositivo}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, dispositivo: dispositivo, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    dispositivo = Dispositivos.get_dispositivo!(id)
    {:ok, _dispositivo} = Dispositivos.delete_dispositivo(dispositivo)

    conn
    |> put_flash(:info, "Dispositivo deleted successfully.")
    |> redirect(to: ~p"/dispositivo")
  end
end
