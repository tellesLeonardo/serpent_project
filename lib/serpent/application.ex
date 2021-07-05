defmodule Serpent.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Serpent.Repo,
      # Start the Telemetry supervisor
      SerpentWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Serpent.PubSub},
      # Start the Endpoint (http/https)
      SerpentWeb.Endpoint
      # Start a worker by calling: Serpent.Worker.start_link(arg)
      # {Serpent.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Serpent.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    SerpentWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
