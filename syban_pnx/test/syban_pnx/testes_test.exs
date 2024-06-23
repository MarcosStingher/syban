defmodule SybanPnx.TestesTest do
  use SybanPnx.DataCase

  alias SybanPnx.Testes

  describe "teste" do
    alias SybanPnx.Testes.Teste

    import SybanPnx.TestesFixtures

    @invalid_attrs %{nome: nil, email: nil, senha: nil}

    test "list_teste/0 returns all teste" do
      teste = teste_fixture()
      assert Testes.list_teste() == [teste]
    end

    test "get_teste!/1 returns the teste with given id" do
      teste = teste_fixture()
      assert Testes.get_teste!(teste.id) == teste
    end

    test "create_teste/1 with valid data creates a teste" do
      valid_attrs = %{nome: "some nome", email: "some email", senha: "some senha"}

      assert {:ok, %Teste{} = teste} = Testes.create_teste(valid_attrs)
      assert teste.nome == "some nome"
      assert teste.email == "some email"
      assert teste.senha == "some senha"
    end

    test "create_teste/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Testes.create_teste(@invalid_attrs)
    end

    test "update_teste/2 with valid data updates the teste" do
      teste = teste_fixture()
      update_attrs = %{nome: "some updated nome", email: "some updated email", senha: "some updated senha"}

      assert {:ok, %Teste{} = teste} = Testes.update_teste(teste, update_attrs)
      assert teste.nome == "some updated nome"
      assert teste.email == "some updated email"
      assert teste.senha == "some updated senha"
    end

    test "update_teste/2 with invalid data returns error changeset" do
      teste = teste_fixture()
      assert {:error, %Ecto.Changeset{}} = Testes.update_teste(teste, @invalid_attrs)
      assert teste == Testes.get_teste!(teste.id)
    end

    test "delete_teste/1 deletes the teste" do
      teste = teste_fixture()
      assert {:ok, %Teste{}} = Testes.delete_teste(teste)
      assert_raise Ecto.NoResultsError, fn -> Testes.get_teste!(teste.id) end
    end

    test "change_teste/1 returns a teste changeset" do
      teste = teste_fixture()
      assert %Ecto.Changeset{} = Testes.change_teste(teste)
    end
  end
end
