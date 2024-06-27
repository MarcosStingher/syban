defmodule SybanPnx.Monitoramento.Evento do
  use Ecto.Schema
  import Ecto.Changeset

  schema "eventos" do
    field :icvinculada, :string
    field :evento, :string
    field :urgencia, :integer
    field :impacto, :integer

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(evento, attrs) do
    evento
    |> cast(attrs, [:icvinculada, :evento, :urgencia, :impacto])
    |> validate_required([:icvinculada, :evento, :urgencia, :impacto])
  end
end
