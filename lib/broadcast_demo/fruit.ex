defmodule BroadcastDemo.Fruit do
  use Ecto.Schema
  import Ecto.Changeset

  schema "fruits" do
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(fruit, attrs) do
    fruit
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
