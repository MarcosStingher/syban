defmodule SybanPnxWeb.RAMUsageLive.Index do
  use SybanPnxWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    if connected?(socket), do: send(self(), :update_data)
    {:ok, assign(socket, data: [], labels: [])}
  end

  @impl true
  def handle_info(:update_data, socket) do
    new_data = :rand.uniform(1000)
    new_label = NaiveDateTime.utc_now() |> NaiveDateTime.to_string()

    Process.send_after(self(), :update_data, 5000)

    {:noreply,
     socket
     |> update(:data, &([new_data | Enum.take(&1, 9)]))
     |> update(:labels, &([new_label | Enum.take(&1, 9)]))
     |> push_event("new_data", %{data: socket.assigns.data, labels: socket.assigns.labels})}
  end
end
