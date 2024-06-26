defmodule SybanPnx.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      SybanPnxWeb.Telemetry,
      SybanPnx.Repo,
      {DNSCluster, query: Application.get_env(:syban_pnx, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: SybanPnx.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: SybanPnx.Finch},
      # Start a worker by calling: SybanPnx.Worker.start_link(arg)
      # {SybanPnx.Worker, arg},
      # Start to serve requests, typically the last entry
      SybanPnxWeb.Endpoint,
    ]


    opts = [strategy: :one_for_one, name: SybanPnx.Supervisor]
    Supervisor.start_link(children, opts)
  end


  @impl true
  def config_change(changed, _new, removed) do
    SybanPnxWeb.Endpoint.config_change(changed, removed)
    :ok
  end

end
