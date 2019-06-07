defmodule Network.Repo do
  use Ecto.Repo,
    otp_app: :network,
    adapter: Ecto.Adapters.Postgres
end
