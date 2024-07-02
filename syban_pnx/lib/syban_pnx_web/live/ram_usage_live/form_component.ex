defmodule SybanPnxWeb.RAMUsageLive.FormComponent do
  use SybanPnxWeb, :live_component

  alias SybanPnx.Dashboard

  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <.header>
        <%= @title %>
      </.header>

      <.simple_form
        for={@form}
        id="ram_usage-form"
        phx-target={@myself}
        phx-change="validate"
        phx-submit="save"
      >

        <:actions>
          <.button phx-disable-with="Saving...">Save Ram usage</.button>
        </:actions>
      </.simple_form>
    </div>
    """
  end

  @impl true
  def update(%{ram_usage: ram_usage} = assigns, socket) do
    changeset = Dashboard.change_ram_usage(ram_usage)

    {:ok,
     socket
     |> assign(assigns)
     |> assign_form(changeset)}
  end

  @impl true
  def handle_event("validate", %{"ram_usage" => ram_usage_params}, socket) do
    changeset =
      socket.assigns.ram_usage
      |> Dashboard.change_ram_usage(ram_usage_params)
      |> Map.put(:action, :validate)

    {:noreply, assign_form(socket, changeset)}
  end

  def handle_event("save", %{"ram_usage" => ram_usage_params}, socket) do
    save_ram_usage(socket, socket.assigns.action, ram_usage_params)
  end

  defp save_ram_usage(socket, :edit, ram_usage_params) do
    case Dashboard.update_ram_usage(socket.assigns.ram_usage, ram_usage_params) do
      {:ok, ram_usage} ->
        notify_parent({:saved, ram_usage})

        {:noreply,
         socket
         |> put_flash(:info, "Ram usage updated successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign_form(socket, changeset)}
    end
  end

  defp save_ram_usage(socket, :new, ram_usage_params) do
    case Dashboard.create_ram_usage(ram_usage_params) do
      {:ok, ram_usage} ->
        notify_parent({:saved, ram_usage})

        {:noreply,
         socket
         |> put_flash(:info, "Ram usage created successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign_form(socket, changeset)}
    end
  end

  defp assign_form(socket, %Ecto.Changeset{} = changeset) do
    assign(socket, :form, to_form(changeset))
  end

  defp notify_parent(msg), do: send(self(), {__MODULE__, msg})
end
