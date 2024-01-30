defmodule HelviSpaceCoWeb.ContractsController do
  use HelviSpaceCoWeb, :controller
  import SpacetradersAPI

  def index(conn, _params) do
    {:ok, agent} = get_resource("my/agent")
    {:ok, contracts} = get_resource("my/contracts")
    render(conn, :index, agent: agent, contracts: contracts)
  end
end
