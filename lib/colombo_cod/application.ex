defmodule ColomboCodModule.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      ColomboCodModule.Repo,
      # Start the Telemetry supervisor
      ColomboCodModuleWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: ColomboCodModule.PubSub},
      # Start the Endpoint (http/https)
      ColomboCodModuleWeb.Endpoint,
      # Start a worker by calling: ColomboCodModule.Worker.start_link(arg)
      # {ColomboCodModule.Worker, arg}
      ColomboCodModule.Workers.PatientsNotification
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: ColomboCodModule.Supervisor]

    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    ColomboCodModuleWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
