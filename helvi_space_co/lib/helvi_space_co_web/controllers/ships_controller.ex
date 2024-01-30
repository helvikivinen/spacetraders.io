defmodule HelviSpaceCoWeb.ShipsController do
  use HelviSpaceCoWeb, :controller
  import SpacetradersAPI

  def index(conn, _params) do
    {:ok, agent} = get_resource("my/agent")
    {:ok, ships} = get_resource("my/ships")
    render(conn, :index, agent: agent, ships: ships)
  end

  def show(conn, %{"symbol" => symbol}) do
    {:ok, agent} = get_resource("my/agent")
    {:ok, ship} = get_resource("my/ships/#{symbol}")
    render(conn, :show, agent: agent, ship: ship, symbol: symbol)
  end
end
