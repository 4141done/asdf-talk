defmodule ElixirExample.JackfruitFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `ElixirExample.Jackfruit` context.
  """

  @doc """
  Generate a fact.
  """
  def fact_fixture(attrs \\ %{}) do
    {:ok, fact} =
      attrs
      |> Enum.into(%{

      })
      |> ElixirExample.Jackfruit.create_fact()

    fact
  end
end
