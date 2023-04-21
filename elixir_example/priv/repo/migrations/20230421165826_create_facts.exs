defmodule ElixirExample.Repo.Migrations.CreateFacts do
  use Ecto.Migration

  def change do
    create table(:facts) do

      timestamps()
    end
  end
end
