use Mix.Config

# Only in tests, remove the complexity from the password hashing algorithm
config :bcrypt_elixir, :log_rounds, 1

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :serpent, Serpent.Repo,
  username: "postgres",
  password: "T5sbHDJPfGk2QBqRlD02UBbC6Vb23JR9ePoJvX5SuxCKFOildxyTDIHJ56hIRyHX",
  database: "the_arte_two_test",
  hostname: "localhost",
  show_sensitive_data_on_connection_error: true,
  pool_size: 10,
  port: 5434
# We don't run a server during test. If one is required,
# you can enable the server option below.
config :serpent, SerpentWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn
