# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :gbenga,
  ecto_repos: [Gbenga.Repo]

# Configures the endpoint
config :gbenga, Gbenga.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "S/bmInEbpB6R27q7QM0Ulj0CT8Zhfxq2QUuysnaSn6CWTVkDbrTp2nFi7z4LYxa+",
  render_errors: [view: Gbenga.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Gbenga.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
