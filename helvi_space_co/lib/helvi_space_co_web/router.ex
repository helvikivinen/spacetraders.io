defmodule HelviSpaceCoWeb.Router do
  use HelviSpaceCoWeb, :router

  pipeline :browser do
    plug(:accepts, ["html"])
    plug(:fetch_session)
    plug(:fetch_live_flash)
    plug(:put_root_layout, html: {HelviSpaceCoWeb.Layouts, :root})
    plug(:protect_from_forgery)
    plug(:put_secure_browser_headers)
  end

  pipeline :api do
    plug(:accepts, ["json"])
  end

  scope "/", HelviSpaceCoWeb do
    pipe_through(:browser)

    get("/", PageController, :home)
    get("/ships", ShipsController, :index)
    get("/ship/:symbol", ShipsController, :show)
    get("/contracts", ContractsController, :index)
    get("/settings", SettingsController, :show)
    get("/settings/register-agent", SettingsController, :register_agent)
  end

  # Other scopes may use custom stacks.
  # scope "/api", HelviSpaceCoWeb do
  #   pipe_through :api
  # end

  # Enable LiveDashboard and Swoosh mailbox preview in development
  if Application.compile_env(:helvi_space_co, :dev_routes) do
    # If you want to use the LiveDashboard in production, you should put
    # it behind authentication and allow only admins to access it.
    # If your application does not have an admins-only section yet,
    # you can use Plug.BasicAuth to set up some basic authentication
    # as long as you are also using SSL (which you should anyway).
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through(:browser)

      live_dashboard("/dashboard", metrics: HelviSpaceCoWeb.Telemetry)
      forward("/mailbox", Plug.Swoosh.MailboxPreview)
    end
  end
end
