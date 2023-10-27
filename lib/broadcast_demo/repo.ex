defmodule BroadcastDemo.Repo do
  use Ecto.Repo,
    otp_app: :broadcast_demo,
    adapter: Ecto.Adapters.SQLite3
end
