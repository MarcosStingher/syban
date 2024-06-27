defmodule SybanPnx.Repo.Migrations.CreateDispositivo do
  use Ecto.Migration

  def change do
    create table(:dispositivo, primary_key: false) do
      add :nomedispositivo, :string

      timestamps(type: :utc_datetime)
    end
  end
end
