defmodule SybanTest do
  use ExUnit.Case
  doctest Syban

  test "greets the world" do
    assert Syban.hello() == :world
  end
end
