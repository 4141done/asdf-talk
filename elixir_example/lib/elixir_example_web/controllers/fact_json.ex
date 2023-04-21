defmodule ElixirExampleWeb.FactJSON do
  alias ElixirExample.Jackfruit.Fact

  @doc """
  Renders a single random fact.
  """
  def random(%{fact: fact}) do
    %{fact: data(fact)}
  end

  defp data(%Fact{} = fact) do
    %{
      id: fact.id,
      text: fact.text
    }
  end
end
