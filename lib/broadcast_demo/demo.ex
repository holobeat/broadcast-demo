defmodule BroadcastDemo.Demo do
  import Ecto.Query, warn: false
  alias BroadcastDemo.{Repo, Fruit}

  @topic "fruits"

  def subscribe do
    Phoenix.PubSub.subscribe(BroadcastDemo.PubSub, @topic)
  end

  def fetch_next_fruit(user, nil) do
    fruit = Repo.get(Fruit, 1)

    broadcast(%{fruit: fruit, user: user})
  end

  def fetch_next_fruit(user, fruit) do
    # if nil result, default to the first record
    fruit = Repo.get(Fruit, fruit.id + 1) || Repo.get(Fruit, 1)

    broadcast(%{fruit: fruit, user: user})
  end

  def broadcast(message) do
    # broadcast the message
    Phoenix.PubSub.broadcast(BroadcastDemo.PubSub, @topic, message)
  end
end
