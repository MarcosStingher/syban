defmodule SybanPnx.Monitoramento do
  @moduledoc """
  The Monitoramento context.
  """
  use Ecto.Schema
  import Ecto.Changeset

  schema "monitoramento" do
    field :datahora, :utc_datetime
    field :idmaquina, :integer
    field :memRamTotal, :decimal
    field :memRamUsada, :decimal
    field :memPercentual, :decimal
    field :discoTotal, :decimal
    field :discoUsado, :decimal
    field :discoPercentual, :decimal
    field :cpuPercentual, :decimal
    field :processLogico, :integer
    field :processFisico, :integer
    field :freqCPU, :decimal
    field :gpuNome, :string
    field :gpuUsada, :decimal
    field :gpuTemp, :decimal
    field :gpuMemTot, :decimal
    field :gpuMemUsada, :decimal
    field :gpuMemLivre, :decimal
    field :idevento, :integer, default: 1

    timestamps(type: :utc_datetime)
  end

  def changeset(dado, attrs) do
    dado
    |> cast(attrs, [:datahora, :idmaquina, :memRamTotal, :memRamUsada, :memPercentual, :discoTotal, :discoUsado, :discoPercentual, :cpuPercentual, :processLogico, :processFisico, :freqCPU, :gpuNome, :gpuUsada, :gpuTemp, :gpuMemTot, :gpuMemUsada, :gpuMemLivre, :idevento])
    |> validate_required([:datahora, :idmaquina, :memRamTotal, :memRamUsada, :memPercentual, :discoTotal, :discoUsado, :discoPercentual, :cpuPercentual, :processLogico, :processFisico, :freqCPU, :gpuNome, :gpuUsada, :gpuTemp, :gpuMemTot, :gpuMemUsada, :gpuMemLivre, :idevento])
  end






  import Ecto.Query, warn: false
  alias SybanPnx.Repo

  alias SybanPnx.Monitoramento.Dado

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
