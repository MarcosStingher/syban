defmodule SybanPnx.Repo.Migrations.CreateRamUsages do
  use Ecto.Migration

  def change do
    create table(:ram_usages) do

      timestamps(type: :utc_datetime)
    end
  end
end
