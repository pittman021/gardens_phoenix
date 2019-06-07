# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :network,
  ecto_repos: [Network.Repo]

# Configures the endpoint
config :network, NetworkWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "SJeYYiGg6HCjDech/6v1Tytc/TwGSycptmR/I/UPHB7sg1BFzT6b2cCA2WY91ZNx",
  render_errors: [view: NetworkWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Network.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"

config :ueberauth, Ueberauth,
  providers: [
    google: {Ueberauth.Strategy.Google, []}
  ]

  config :ueberauth, Ueberauth.Strategy.Google.OAuth,
    client_id: "387364182408-gq2i27qamtn3atfccpq1csvimbbhef0n.apps.googleusercontent.com",
    client_secret: "szouNpiB2UOhbtbmNJI3sn-W"