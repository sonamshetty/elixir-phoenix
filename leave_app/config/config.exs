# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :leave_app,
  ecto_repos: [LeaveApp.Repo]

# Configures the endpoint
config :leave_app, LeaveApp.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "BY0lSVlIMytoNsXWM6I1S809aNrx0+TXY4UBlCCodF9ka4hwxH9GGDEUNcv9mOM/",
  render_errors: [view: LeaveApp.ErrorView, accepts: ~w(html json)],
  pubsub: [name: LeaveApp.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

config :leave_app,
       mailgun_domain: System.get_env("MAILGUN_DOMAIN"),
       mailgun_key: System.get_env("MAILGUN_KEY"),
       admin_user: System.get_env("ADMIN_USER")
