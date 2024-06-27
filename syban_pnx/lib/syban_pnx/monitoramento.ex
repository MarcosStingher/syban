defmodule SybanPnx.Monitoramento do
  @moduledoc """
  The Monitoramento context.
  """
  use Ecto.Schema
  import Ecto.Changeset

  alias SybanPnx.Processor

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

    timestamps(type: :utc_datetime)
  end

  def changeset(dado, attrs) do
    dado
    |> cast(attrs, [:datahora, :idmaquina, :memRamTotal, :memRamUsada, :memPercentual, :discoTotal, :discoUsado, :discoPercentual, :cpuPercentual, :processLogico, :processFisico, :freqCPU, :gpuNome, :gpuUsada, :gpuTemp, :gpuMemTot, :gpuMemUsada, :gpuMemLivre])
    |> validate_required([:datahora, :idmaquina, :memRamTotal, :memRamUsada, :memPercentual, :discoTotal, :discoUsado, :discoPercentual, :cpuPercentual, :processLogico, :processFisico, :freqCPU, :gpuNome, :gpuUsada, :gpuTemp, :gpuMemTot, :gpuMemUsada, :gpuMemLivre])
  end


  def after_insert(changeset) do
    Processor.processar_dados(changeset.changes)
    changeset
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

  alias SybanPnx.Monitoramento.Evento

  @doc """
  Returns the list of eventos.

  ## Examples

      iex> list_eventos()
      [%Evento{}, ...]

  """
  def list_eventos do
    Repo.all(Evento)
  end

  @doc """
  Gets a single evento.

  Raises `Ecto.NoResultsError` if the Evento does not exist.

  ## Examples

      iex> get_evento!(123)
      %Evento{}

      iex> get_evento!(456)
      ** (Ecto.NoResultsError)

  """
  def get_evento!(id), do: Repo.get!(Evento, id)

  @doc """
  Creates a evento.

  ## Examples

      iex> create_evento(%{field: value})
      {:ok, %Evento{}}

      iex> create_evento(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_evento(attrs \\ %{}) do
    %Evento{}
    |> Evento.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a evento.

  ## Examples

      iex> update_evento(evento, %{field: new_value})
      {:ok, %Evento{}}

      iex> update_evento(evento, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_evento(%Evento{} = evento, attrs) do
    evento
    |> Evento.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a evento.

  ## Examples

      iex> delete_evento(evento)
      {:ok, %Evento{}}

      iex> delete_evento(evento)
      {:error, %Ecto.Changeset{}}

  """
  def delete_evento(%Evento{} = evento) do
    Repo.delete(evento)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking evento changes.

  ## Examples

      iex> change_evento(evento)
      %Ecto.Changeset{data: %Evento{}}

  """
  def change_evento(%Evento{} = evento, attrs \\ %{}) do
    Evento.changeset(evento, attrs)
  end
end
