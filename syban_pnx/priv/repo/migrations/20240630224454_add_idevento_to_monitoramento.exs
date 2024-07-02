defmodule SybanPnx.Repo.Migrations.AddIdeventoToMonitoramento do
  use Ecto.Migration

  def change do
    alter table(:monitoramento) do
      add :idevento, :integer, default: 1, null: false
    end
  end
end
