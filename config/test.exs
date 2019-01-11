use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :drakolis, DrakolisWeb.Endpoint,
  http: [port: 8002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :drakolis, Drakolis.Repo,
  username: "postgres",
  password: "postgres",
  database: "drakolis_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
