defmodule SybanPnx.TestesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `SybanPnx.Testes` context.
  """

  @doc """
  Generate a unique teste email.
  """
  def unique_teste_email, do: "some email#{System.unique_integer([:positive])}"

  @doc """
  Generate a teste.
  """
  def teste_fixture(attrs \\ %{}) do
    {:ok, teste} =
      attrs
      |> Enum.into(%{
        email: unique_teste_email(),
        nome: "some nome",
        senha: "some senha"
      })
      |> SybanPnx.Testes.create_teste()

    teste
  end
end
