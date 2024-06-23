defmodule SybanPnx.Testes do
  @moduledoc """
  The Testes context.
  """

  import Ecto.Query, warn: false
  alias SybanPnx.Repo

  alias SybanPnx.Testes.Teste

  @doc """
  Returns the list of teste.

  ## Examples

      iex> list_teste()
      [%Teste{}, ...]

  """
  def list_teste do
    Repo.all(Teste)
  end

  @doc """
  Gets a single teste.

  Raises `Ecto.NoResultsError` if the Teste does not exist.

  ## Examples

      iex> get_teste!(123)
      %Teste{}

      iex> get_teste!(456)
      ** (Ecto.NoResultsError)

  """
  def get_teste!(id), do: Repo.get!(Teste, id)

  @doc """
  Creates a teste.

  ## Examples

      iex> create_teste(%{field: value})
      {:ok, %Teste{}}

      iex> create_teste(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_teste(attrs \\ %{}) do
    %Teste{}
    |> Teste.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a teste.

  ## Examples

      iex> update_teste(teste, %{field: new_value})
      {:ok, %Teste{}}

      iex> update_teste(teste, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_teste(%Teste{} = teste, attrs) do
    teste
    |> Teste.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a teste.

  ## Examples

      iex> delete_teste(teste)
      {:ok, %Teste{}}

      iex> delete_teste(teste)
      {:error, %Ecto.Changeset{}}

  """
  def delete_teste(%Teste{} = teste) do
    Repo.delete(teste)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking teste changes.

  ## Examples

      iex> change_teste(teste)
      %Ecto.Changeset{data: %Teste{}}

  """
  def change_teste(%Teste{} = teste, attrs \\ %{}) do
    Teste.changeset(teste, attrs)
  end
end
