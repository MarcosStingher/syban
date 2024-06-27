defmodule SybanPnx.Dashboard do
  @moduledoc """
  The Dashboard context.
  """

  import Ecto.Query, warn: false
  alias SybanPnx.Repo

  alias SybanPnx.Dashboard.RAMUsage

  @doc """
  Returns the list of ram_usages.

  ## Examples

      iex> list_ram_usages()
      [%RAMUsage{}, ...]

  """
  def list_ram_usages do
    Repo.all(RAMUsage)
  end

  @doc """
  Gets a single ram_usage.

  Raises `Ecto.NoResultsError` if the Ram usage does not exist.

  ## Examples

      iex> get_ram_usage!(123)
      %RAMUsage{}

      iex> get_ram_usage!(456)
      ** (Ecto.NoResultsError)

  """
  def get_ram_usage!(id), do: Repo.get!(RAMUsage, id)

  @doc """
  Creates a ram_usage.

  ## Examples

      iex> create_ram_usage(%{field: value})
      {:ok, %RAMUsage{}}

      iex> create_ram_usage(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_ram_usage(attrs \\ %{}) do
    %RAMUsage{}
    |> RAMUsage.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a ram_usage.

  ## Examples

      iex> update_ram_usage(ram_usage, %{field: new_value})
      {:ok, %RAMUsage{}}

      iex> update_ram_usage(ram_usage, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_ram_usage(%RAMUsage{} = ram_usage, attrs) do
    ram_usage
    |> RAMUsage.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a ram_usage.

  ## Examples

      iex> delete_ram_usage(ram_usage)
      {:ok, %RAMUsage{}}

      iex> delete_ram_usage(ram_usage)
      {:error, %Ecto.Changeset{}}

  """
  def delete_ram_usage(%RAMUsage{} = ram_usage) do
    Repo.delete(ram_usage)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking ram_usage changes.

  ## Examples

      iex> change_ram_usage(ram_usage)
      %Ecto.Changeset{data: %RAMUsage{}}

  """
  def change_ram_usage(%RAMUsage{} = ram_usage, attrs \\ %{}) do
    RAMUsage.changeset(ram_usage, attrs)
  end
end
