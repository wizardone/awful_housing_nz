# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :awful_housing_nz,
  ecto_repos: [AwfulHousingNz.Repo]

# Configures the endpoint
config :awful_housing_nz, AwfulHousingNzWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "5CTuSD4EoywNsx7YgYkqR0m5REG0fn3fuiyLPBW1daK7HLrZk8C+SijIWejJSXjD",
  render_errors: [view: AwfulHousingNzWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: AwfulHousingNz.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
