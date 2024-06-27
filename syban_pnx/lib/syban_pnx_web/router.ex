defmodule SybanPnxWeb.Router do
  use SybanPnxWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, html: {SybanPnxWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", SybanPnxWeb do
    pipe_through :browser
    get "/", PageController, :home
    resources "/teste", TesteController, except: [:new, :edit]
    resources "/dispositivo", DispositivoController
    resources "/monitoramento", DadoController, except: [:new, :edit]
  end

  scope "/api", SybanPnxWeb do
    pipe_through :api
    get "/teste", TesteController, :index
    get "/monitoramento", DadoController, :index
    post "/monitoramento", DadoController, :create
  end

  scope "/", SybanPnxWeb do
    pipe_through :browser

    live "/ram-usage", RAMUsageLive.Index, :index
  end


  # Enable LiveDashboard and Swoosh mailbox preview in development
  if Application.compile_env(:syban_pnx, :dev_routes) do
    # If you want to use the LiveDashboard in production, you should put
    # it behind authentication and allow only admins to access it.
    # If your application does not have an admins-only section yet,
    # you can use Plug.BasicAuth to set up some basic authentication
    # as long as you are also using SSL (which you should anyway).
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through :browser

      live_dashboard "/dashboard", metrics: SybanPnxWeb.Telemetry
      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
