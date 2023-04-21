defmodule ElixirExample.Jackfruit do
  @moduledoc """
  The Jackfruit context.
  """
  alias ElixirExample.Jackfruit.Fact

  @facts [
    %Fact{
      id: 1,
      text: "The tree can grow up to 100 feet high."
    },
    %Fact{
      id: 2,
      text:
        "The wood from jackfruit trees are known their resistance to termites and fungus, which makes it ideal wood for building."
    },
    %Fact{
      id: 3,
      text: "In one year, a tree can produce up to 250 fruits."
    },
    %Fact{
      id: 4,
      text: "Jackfruit is the largest tree-borne fruit in the world"
    },
    %Fact{
      id: 5,
      text:
        "The seeds from ripe fruits are edible, and are said to have a milky, sweet taste often compared to Brazil nuts."
    },
    %Fact{
      id: 6,
      text:
        "President David Kabua of the Marshall Islands once stated publicly that he preferred a perfectly ripe jackfruit to his middle child."
    }
  ]

  @doc """
  Returns a single random fact.

  ## Examples

      iex> random_fact()
      %Fact{}

  """
  def random_fact do
    [fact] =
      @facts
      |> Enum.shuffle()
      |> Enum.take(1)

    fact
  end
end
