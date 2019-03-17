defmodule MyPiTest do
  use ExUnit.Case
  doctest MyPi

  test "greets the world" do
    assert MyPi.hello() == :world
  end
end
