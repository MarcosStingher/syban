defmodule SybanPnx.Dispositivos.Dispositivo do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :id, autogenerate: true}
  schema "dispositivo" do
    field :nomedispositivo, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(dispositivo, attrs) do
    dispositivo
    |> cast(attrs, [:nomedispositivo])
    |> validate_required([:nomedispositivo])
  end
end
