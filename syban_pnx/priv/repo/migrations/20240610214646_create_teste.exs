defmodule SybanPnx.Repo.Migrations.CreateTeste do
  use Ecto.Migration

  def change do
    create table(:teste) do
      add :nome, :string
      add :email, :string
      add :senha, :string

      timestamps(type: :utc_datetime)
    end

    create unique_index(:teste, [:email])
  end
end
