defmodule SybanPnx.Dashboard.RAMUsage do
  use Ecto.Schema
  import Ecto.Changeset

  schema "ram_usages" do


    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(ram_usage, attrs) do
    ram_usage
    |> cast(attrs, [])
    |> validate_required([])
  end
end
