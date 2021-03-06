# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :drakolis,
  ecto_repos: [Drakolis.Repo]

# Configures the endpoint
config :drakolis, DrakolisWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "rJ37YFRQ8Cc5RLD1kqUmxrjyoputIkkqtbAro/faB6xlVcIJw9DjbbYv6tmZ11Qp",
  render_errors: [view: DrakolisWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: Drakolis.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Guardian config
config :drakolis, Drakolis.Guardian,
  issuer: "YourDragonEmpress",
  secret_key: "7Iws+xLTzJ46vkf+jY/Nc3sRNKaOS8mbK8bPIv+7RzUoUkYIVGqy/gT/knghfJaq"

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
