# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :feather,
  ecto_repos: [Feather.Repo]

# config :feather, Feather.Repo,
#   extensions: [{Geo.PostGIS.Extension, library: Geo}]

# Configures the endpoint
config :feather, FeatherWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "Qxc3/AIj28QGBBMtKeiMNdMZ3begwS3c313fOJ6iKb5Wunv7yIL0+sFCOJXWMhtA",
  render_errors: [view: FeatherWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: Feather.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
