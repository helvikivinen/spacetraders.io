defmodule HelviSpaceCoWeb.PageController do
  use HelviSpaceCoWeb, :controller
  import SpacetradersAPI
  require Logger

  def home(conn, _params) do
    # {:ok, agent} = get_resource(~c"game/status")
    # The home page is often custom made,
    # so skip the default app layout.
    # render(conn, :home, layout: false, agent: agent)

    {:ok, agent} = get_resource("my/agent")
    Logger.debug(agent)

    {:ok, waypoint} =
      get_resource(
        "systems/#{get_system(agent["data"]["headquarters"])}/waypoints/#{get_waypoint(agent["data"]["headquarters"])}"
      )

    render(conn, :home, agent: agent, waypoint: waypoint)
  end

  defp get_sector(symbol) do
    String.split(symbol, "-")
    |> Enum.take(1)
  end

  defp get_system(symbol) do
    String.split(symbol, "-")
    |> Enum.drop(-1)
    |> Enum.join("-")
  end

  defp get_waypoint(symbol) do
    symbol
  end
end
