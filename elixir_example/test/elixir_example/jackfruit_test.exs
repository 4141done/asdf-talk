defmodule ElixirExample.JackfruitTest do
  use ExUnit.Case

  alias ElixirExample.Jackfruit

  describe "facts" do
    alias ElixirExample.Jackfruit.Fact

    test "gives back a fact" do
      assert [] = Jackfruit.random_fact()
    end
  end
end
