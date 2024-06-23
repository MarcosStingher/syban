defmodule SybanPnx.DispositivosFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `SybanPnx.Dispositivos` context.
  """

  @doc """
  Generate a dispositivo.
  """
  def dispositivo_fixture(attrs \\ %{}) do
    {:ok, dispositivo} =
      attrs
      |> Enum.into(%{
        nomedispositivo: "some nomedispositivo"
      })
      |> SybanPnx.Dispositivos.create_dispositivo()

    dispositivo
  end
end
