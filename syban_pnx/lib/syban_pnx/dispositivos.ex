defmodule SybanPnx.Dispositivos do
  @moduledoc """
  The Dispositivos context.
  """

  import Ecto.Query, warn: false
  alias SybanPnx.Repo

  alias SybanPnx.Dispositivos.Dispositivo

  @doc """
  Returns the list of dispositivo.

  ## Examples

      iex> list_dispositivo()
      [%Dispositivo{}, ...]

  """
  def list_dispositivo do
    Repo.all(Dispositivo)
  end

  @doc """
  Gets a single dispositivo.

  Raises `Ecto.NoResultsError` if the Dispositivo does not exist.

  ## Examples

      iex> get_dispositivo!(123)
      %Dispositivo{}

      iex> get_dispositivo!(456)
      ** (Ecto.NoResultsError)

  """
  def get_dispositivo!(id), do: Repo.get!(Dispositivo, id)

  @doc """
  Creates a dispositivo.

  ## Examples

      iex> create_dispositivo(%{field: value})
      {:ok, %Dispositivo{}}

      iex> create_dispositivo(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_dispositivo(attrs \\ %{}) do
    %Dispositivo{}
    |> Dispositivo.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a dispositivo.

  ## Examples

      iex> update_dispositivo(dispositivo, %{field: new_value})
      {:ok, %Dispositivo{}}

      iex> update_dispositivo(dispositivo, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_dispositivo(%Dispositivo{} = dispositivo, attrs) do
    dispositivo
    |> Dispositivo.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a dispositivo.

  ## Examples

      iex> delete_dispositivo(dispositivo)
      {:ok, %Dispositivo{}}

      iex> delete_dispositivo(dispositivo)
      {:error, %Ecto.Changeset{}}

  """
  def delete_dispositivo(%Dispositivo{} = dispositivo) do
    Repo.delete(dispositivo)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking dispositivo changes.

  ## Examples

      iex> change_dispositivo(dispositivo)
      %Ecto.Changeset{data: %Dispositivo{}}

  """
  def change_dispositivo(%Dispositivo{} = dispositivo, attrs \\ %{}) do
    Dispositivo.changeset(dispositivo, attrs)
  end
end
