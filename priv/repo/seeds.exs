# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     BroadcastDemo.Repo.insert!(%BroadcastDemo.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias BroadcastDemo.{Fruit, Repo}

fruits = ["Apple", "Banana", "Pear", "Strawberry", "Mango"]

Repo.delete_all(Fruit)

results =
  for fruit <- fruits do
    Repo.insert!(%Fruit{name: fruit})
  end

IO.inspect(results)
