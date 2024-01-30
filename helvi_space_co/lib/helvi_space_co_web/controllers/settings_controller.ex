defmodule HelviSpaceCoWeb.SettingsController do
  use HelviSpaceCoWeb, :controller
  import SpacetradersAPI

  def show(conn, _params) do
    {:ok, agent} = get_resource("my/agent")

    render(conn, :settings, agent: agent)
  end

  def register_agent(conn, _params) do
    agent = SpacetradersAPI.register_agent()

    conn
    |> put_flash(:info, "Re-registering agent")
    |> render(:settings)
  end
end
