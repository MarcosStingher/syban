defmodule SybanPnx.DashboardTest do
  use SybanPnx.DataCase

  alias SybanPnx.Dashboard

  describe "ram_usages" do
    alias SybanPnx.Dashboard.RAMUsage

    import SybanPnx.DashboardFixtures

    @invalid_attrs %{}

    test "list_ram_usages/0 returns all ram_usages" do
      ram_usage = ram_usage_fixture()
      assert Dashboard.list_ram_usages() == [ram_usage]
    end

    test "get_ram_usage!/1 returns the ram_usage with given id" do
      ram_usage = ram_usage_fixture()
      assert Dashboard.get_ram_usage!(ram_usage.id) == ram_usage
    end

    test "create_ram_usage/1 with valid data creates a ram_usage" do
      valid_attrs = %{}

      assert {:ok, %RAMUsage{} = ram_usage} = Dashboard.create_ram_usage(valid_attrs)
    end

    test "create_ram_usage/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Dashboard.create_ram_usage(@invalid_attrs)
    end

    test "update_ram_usage/2 with valid data updates the ram_usage" do
      ram_usage = ram_usage_fixture()
      update_attrs = %{}

      assert {:ok, %RAMUsage{} = ram_usage} = Dashboard.update_ram_usage(ram_usage, update_attrs)
    end

    test "update_ram_usage/2 with invalid data returns error changeset" do
      ram_usage = ram_usage_fixture()
      assert {:error, %Ecto.Changeset{}} = Dashboard.update_ram_usage(ram_usage, @invalid_attrs)
      assert ram_usage == Dashboard.get_ram_usage!(ram_usage.id)
    end

    test "delete_ram_usage/1 deletes the ram_usage" do
      ram_usage = ram_usage_fixture()
      assert {:ok, %RAMUsage{}} = Dashboard.delete_ram_usage(ram_usage)
      assert_raise Ecto.NoResultsError, fn -> Dashboard.get_ram_usage!(ram_usage.id) end
    end

    test "change_ram_usage/1 returns a ram_usage changeset" do
      ram_usage = ram_usage_fixture()
      assert %Ecto.Changeset{} = Dashboard.change_ram_usage(ram_usage)
    end
  end
end
