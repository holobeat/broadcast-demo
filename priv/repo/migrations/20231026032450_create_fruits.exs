defmodule BroadcastDemo.Repo.Migrations.CreateFruits do
  use Ecto.Migration

  def change do
    create table(:fruits) do
      add :name, :string

      timestamps()
    end
  end
end
