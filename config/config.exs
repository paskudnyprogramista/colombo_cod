# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :colombo_cod,
  namespace: ColomboCodModule,
  ecto_repos: [ColomboCodModule.Repo]

# Configures the endpoint
config :colombo_cod, ColomboCodModuleWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "8x2eGrXBKxVhtiaQnex2r6FYmE3bfS//PpumirkrDRhvN1Vi+swdmIcfCtqM6zKt",
  render_errors: [view: ColomboCodModuleWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: ColomboCodModule.PubSub,
  live_view: [signing_salt: "WiyHUSyz"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
