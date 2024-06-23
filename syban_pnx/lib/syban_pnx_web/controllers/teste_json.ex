defmodule SybanPnxWeb.TesteJSON do
  alias SybanPnx.Testes.Teste

  @doc """
  Renders a list of teste.
  """
  def index(%{teste: teste}) do
    %{data: for(teste <- teste, do: data(teste))}
  end

  @doc """
  Renders a single teste.
  """
  def show(%{teste: teste}) do
    %{data: data(teste)}
  end

  defp data(%Teste{} = teste) do
    %{
      id: teste.id,
      nome: teste.nome,
      email: teste.email,
      senha: teste.senha
    }
  end
end
