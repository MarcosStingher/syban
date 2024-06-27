defmodule SybanPnx.DashboardFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `SybanPnx.Dashboard` context.
  """

  @doc """
  Generate a ram_usage.
  """
  def ram_usage_fixture(attrs \\ %{}) do
    {:ok, ram_usage} =
      attrs
      |> Enum.into(%{

      })
      |> SybanPnx.Dashboard.create_ram_usage()

    ram_usage
  end
end
