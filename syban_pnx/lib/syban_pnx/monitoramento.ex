defmodule SybanPnx.Monitoramento do
  @moduledoc """
  The Monitoramento context.
  """

  import Ecto.Query, warn: false
  alias SybanPnx.Repo

  alias SybanPnx.Monitoramento.Dado

  @doc """
  Returns the list of monitoramento.

  ## Examples

      iex> list_monitoramento()
      [%Dado{}, ...]

  """
  def list_monitoramento do
    Repo.all(Dado)
  end

  @doc """
  Gets a single dado.

  Raises `Ecto.NoResultsError` if the Dado does not exist.

  ## Examples

      iex> get_dado!(123)
      %Dado{}

      iex> get_dado!(456)
      ** (Ecto.NoResultsError)

  """
  def get_dado!(id), do: Repo.get!(Dado, id)

  @doc """
  Creates a dado.

  ## Examples

      iex> create_dado(%{field: value})
      {:ok, %Dado{}}

      iex> create_dado(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_dado(attrs \\ %{}) do
    %Dado{}
    |> Dado.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a dado.

  ## Examples

      iex> update_dado(dado, %{field: new_value})
      {:ok, %Dado{}}

      iex> update_dado(dado, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_dado(%Dado{} = dado, attrs) do
    dado
    |> Dado.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a dado.

  ## Examples

      iex> delete_dado(dado)
      {:ok, %Dado{}}

      iex> delete_dado(dado)
      {:error, %Ecto.Changeset{}}

  """
  def delete_dado(%Dado{} = dado) do
    Repo.delete(dado)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking dado changes.

  ## Examples

      iex> change_dado(dado)
      %Ecto.Changeset{data: %Dado{}}

  """
  def change_dado(%Dado{} = dado, attrs \\ %{}) do
    Dado.changeset(dado, attrs)
  end
end
