defmodule ForestCampServer.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      ForestCampServerWeb.Telemetry,
      # Start the Ecto repository
      ForestCampServer.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: ForestCampServer.PubSub},
      # Start Finch
      {Finch, name: ForestCampServer.Finch},
      # Start the Endpoint (http/https)
      ForestCampServerWeb.Endpoint
      # Start a worker by calling: ForestCampServer.Worker.start_link(arg)
      # {ForestCampServer.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: ForestCampServer.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    ForestCampServerWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
