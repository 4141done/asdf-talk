defmodule ElixirExampleWeb.FactControllerTest do
  use ElixirExampleWeb.ConnCase

  import ElixirExample.JackfruitFixtures

  alias ElixirExample.Jackfruit.Fact

  @create_attrs %{}
  @update_attrs %{}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "random" do
    test "gives a fact", %{conn: conn} do
      conn = get(conn, ~p"/api/jackfruit/facts/random")
      assert %{"id" => id, "text" => text} = json_response(conn, 200)["fact"]
    end
  end
end
