# This file is responsible for configuring your application
# and its dependencies with the aid of the Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

config :forest_camp_server,
  ecto_repos: [ForestCampServer.Repo]

# Configures the endpoint
config :forest_camp_server, ForestCampServerWeb.Endpoint,
  url: [host: "localhost"],
  render_errors: [
    formats: [json: ForestCampServerWeb.ErrorJSON],
    layout: false
  ],
  pubsub_server: ForestCampServer.PubSub,
  live_view: [signing_salt: "VtFmMp7h"]

config :my_app, MyApp.Guardian,
  issuer: "forest_camp_server",
  secret_key: System.get_env("GUARDIANSECRET")

# Configures the mailer
#
# By default it uses the "Local" adapter which stores the emails
# locally. You can see the emails in your browser, at "/dev/mailbox".
#
# For production it's recommended to configure a different adapter
# at the `config/runtime.exs`.
config :forest_camp_server, ForestCampServer.Mailer, adapter: Swoosh.Adapters.Local

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"
