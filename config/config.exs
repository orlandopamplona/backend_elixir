# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :users_account,
  ecto_repos: [UsersAccount.Repo]

# Configures the endpoint
config :users_account, UsersAccountWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "xK7yzfnvTxAQxNunZyR2Z/v12YCsVP68yh/WVia3QLdqashwICzYdHuioggxf6vL",
  render_errors: [view: UsersAccountWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: UsersAccount.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Configures Mail
config :users_account, UsersAccount.Mailer,
  adapter: Bamboo.SMTPAdapter,
  server: "smtp.gmail.com",
  port: 465,
  username: "name",
  password: "password",
  ssl: true,
  retries: 1

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
