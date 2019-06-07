use Mix.Config

# Configure your database
config :network, Network.Repo,
  username: "postgres",
  password: "postgres",
  database: "network_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :network, NetworkWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn
