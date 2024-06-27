defmodule SybanPnxWeb.RAMUsageLive do
  use SybanPnxWeb, :live_view
  alias HTTPoison
  alias Jason

  @api_url "http://localhost:4000/api/monitoramento"

  @impl true
  def mount(_params, _session, socket) do
    if connected?(socket), do: send(self(), :fetch_data)
    {:ok, assign(socket, data: [], labels: [])}
  end

  @impl true
  def handle_info(:fetch_data, socket) do
    case HTTPoison.get(@api_url) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        IO.inspect(body, label: "Resposta da API")
        %{"data" => data} = Jason.decode!(body)
        {new_labels, new_data} = extract_chart_data(data)
        IO.inspect(new_labels, label: "Labels extraídos")
        IO.inspect(new_data, label: "Dados extraídos")
        {:noreply,
         socket
         |> assign(data: new_data, labels: new_labels)
         |> push_event("new_data", %{data: new_data, labels: new_labels})}

      {:error, %HTTPoison.Error{reason: reason}} ->
        IO.inspect(reason, label: "Erro ao buscar dados da API")
        {:noreply, socket}
    end

    Process.send_after(self(), :fetch_data, 5000) # Atualizar a cada 5 segundos
  end

  defp extract_chart_data(data) do
    labels = Enum.map(data, fn item -> item["datahora"] end)
    cpu_data = Enum.map(data, fn item -> String.to_float(item["cpuPercentual"]) end)

    {labels, cpu_data}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <div id="chart-container" phx-update="ignore">
      <canvas id="ramUsageChart" width="400" height="200"></canvas>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script>
      let ctx = document.getElementById('ramUsageChart').getContext('2d');
      let ramUsageChart = new Chart(ctx, {
          type: 'line',
          data: {
              labels: [],
              datasets: [{
                  label: 'Uso de CPU (%)',
                  data: [],
                  fill: false,
                  borderColor: 'rgb(75, 192, 192)',
                  tension: 0.1
              }]
          },
          options: {
              scales: {
                  y: {
                      beginAtZero: true
                  }
              }
          }
      });

      window.addEventListener("phx:new_data", (e) => {
          ramUsageChart.data.labels = e.detail.labels;
          ramUsageChart.data.datasets[0].data = e.detail.data;
          ramUsageChart.update();
      });
    </script>
    """
  end
end
