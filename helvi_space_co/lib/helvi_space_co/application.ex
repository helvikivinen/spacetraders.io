defmodule HelviSpaceCo.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    Confex.resolve_env!(:helvi_space_co)

    # Config.import_config "../../config/secrets.exs"

    children = [
      # Start the Telemetry supervisor
      HelviSpaceCoWeb.Telemetry,
      # Start the Ecto repository
      HelviSpaceCo.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: HelviSpaceCo.PubSub},
      # Start Finch
      {Finch, name: HelviSpaceCo.Finch},
      # Start the Endpoint (http/https)
      HelviSpaceCoWeb.Endpoint
      # Start a worker by calling: HelviSpaceCo.Worker.start_link(arg)
      # {HelviSpaceCo.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: HelviSpaceCo.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    HelviSpaceCoWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
