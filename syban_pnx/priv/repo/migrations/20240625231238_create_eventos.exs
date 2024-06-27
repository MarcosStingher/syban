defmodule SybanPnx.Repo.Migrations.CreateEventos do
  use Ecto.Migration

  def change do
    create table(:eventos) do
      add :icvinculada, :string
      add :evento, :string
      add :urgencia, :integer
      add :impacto, :integer

      timestamps(type: :utc_datetime)
    end
  end
end
