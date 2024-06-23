defmodule SybanPnx.Testes.Teste do
  use Ecto.Schema
  import Ecto.Changeset

  schema "teste" do
    field :nome, :string
    field :email, :string
    field :senha, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(teste, attrs) do
    teste
    |> cast(attrs, [:nome, :email, :senha])
    |> validate_required([:nome, :email, :senha])
    |> unique_constraint(:email)
  end
end
