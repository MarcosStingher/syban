defmodule SybanPnx.DispositivosTest do
  use SybanPnx.DataCase

  alias SybanPnx.Dispositivos

  describe "dispositivo" do
    alias SybanPnx.Dispositivos.Dispositivo

    import SybanPnx.DispositivosFixtures

    @invalid_attrs %{nomedispositivo: nil}

    test "list_dispositivo/0 returns all dispositivo" do
      dispositivo = dispositivo_fixture()
      assert Dispositivos.list_dispositivo() == [dispositivo]
    end

    test "get_dispositivo!/1 returns the dispositivo with given id" do
      dispositivo = dispositivo_fixture()
      assert Dispositivos.get_dispositivo!(dispositivo.id) == dispositivo
    end

    test "create_dispositivo/1 with valid data creates a dispositivo" do
      valid_attrs = %{nomedispositivo: "some nomedispositivo"}

      assert {:ok, %Dispositivo{} = dispositivo} = Dispositivos.create_dispositivo(valid_attrs)
      assert dispositivo.nomedispositivo == "some nomedispositivo"
    end

    test "create_dispositivo/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Dispositivos.create_dispositivo(@invalid_attrs)
    end

    test "update_dispositivo/2 with valid data updates the dispositivo" do
      dispositivo = dispositivo_fixture()
      update_attrs = %{nomedispositivo: "some updated nomedispositivo"}

      assert {:ok, %Dispositivo{} = dispositivo} = Dispositivos.update_dispositivo(dispositivo, update_attrs)
      assert dispositivo.nomedispositivo == "some updated nomedispositivo"
    end

    test "update_dispositivo/2 with invalid data returns error changeset" do
      dispositivo = dispositivo_fixture()
      assert {:error, %Ecto.Changeset{}} = Dispositivos.update_dispositivo(dispositivo, @invalid_attrs)
      assert dispositivo == Dispositivos.get_dispositivo!(dispositivo.id)
    end

    test "delete_dispositivo/1 deletes the dispositivo" do
      dispositivo = dispositivo_fixture()
      assert {:ok, %Dispositivo{}} = Dispositivos.delete_dispositivo(dispositivo)
      assert_raise Ecto.NoResultsError, fn -> Dispositivos.get_dispositivo!(dispositivo.id) end
    end

    test "change_dispositivo/1 returns a dispositivo changeset" do
      dispositivo = dispositivo_fixture()
      assert %Ecto.Changeset{} = Dispositivos.change_dispositivo(dispositivo)
    end
  end
end
