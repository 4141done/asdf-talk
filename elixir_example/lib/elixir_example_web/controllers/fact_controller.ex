defmodule ElixirExampleWeb.FactController do
  use ElixirExampleWeb, :controller

  alias ElixirExample.Jackfruit
  alias ElixirExample.Jackfruit.Fact

  action_fallback ElixirExampleWeb.FallbackController

  def random(conn, _params) do
    fact = Jackfruit.random_fact()
    render(conn, :random, fact: fact)
  end
end
