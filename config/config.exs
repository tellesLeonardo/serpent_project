# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :serpent,
  ecto_repos: [Serpent.Repo]

# Configures the endpoint
config :serpent, SerpentWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "x7/5iGgbElH44OS+nuvB711uL1sN0sRsYBzoUE/uKm9vkS7Kr4I4+x4Btg8iGquZ",
  render_errors: [view: SerpentWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Serpent.PubSub,
  live_view: [signing_salt: "VzafMtSn"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# amazon

config :ex_aws,
  json_codec: Jason,
  access_key_id: System.get_env("access_key_id"),
  region: "sa-east-1",
  secret_access_key: System.get_env("secret_access_key")


# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
