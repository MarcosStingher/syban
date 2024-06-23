defmodule SybanPnx.Repo do
  use Ecto.Repo,
    otp_app: :syban_pnx,
    adapter: Ecto.Adapters.Postgres
end
