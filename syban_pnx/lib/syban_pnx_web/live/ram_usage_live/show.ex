defmodule SybanPnxWeb.RAMUsageLive.Show do
  use SybanPnxWeb, :live_view

  alias SybanPnx.Dashboard

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:ram_usage, Dashboard.get_ram_usage!(id))}
  end

  defp page_title(:show), do: "Show Ram usage"
  defp page_title(:edit), do: "Edit Ram usage"
end
