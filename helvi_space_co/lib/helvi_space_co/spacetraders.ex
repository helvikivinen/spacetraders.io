defmodule SpacetradersAPI do
  use HTTPoison.Base
  require Logger

  @base_url "https://api.spacetraders.io/v2"

  def get_resource(resource_id) do
    api_key = Application.get_env(:helvi_space_co, :spacetraders_api_key)

    url = "#{@base_url}/#{resource_id}"

    headers = [
      {"Authorization", "Bearer #{api_key}"}
    ]

    case get(url, headers) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        Logger.info(body)
        {:ok, body |> Poison.decode!()}

      {:ok, %HTTPoison.Response{status_code: code, body: body}} ->
        {:error, "Request failed HTTP #{code}: #{body}"}

      {:error, %HTTPoison.Error{reason: reason}} ->
        {:error, reason}
    end
  end

  # def post_resource(resource_id) do
  #   api_key = Application.get_env(:helvi_space_co, :spacetraders_api_key)

  #   Logger.info(api_key)

  #   url = "#{@base_url}/#{resource_id}"

  #   headers = [
  #     "Content-Type: application/json"
  #   ]
  # end

  def register_agent do
    url = "https://api.spacetraders.io/v2/register"

    body =
      %{
        "symbol" => "LIBRARYGIRL",
        "faction" => "COSMIC"
      }
      |> Poison.encode!()

    do_post = post(url, body, %{"Content-Type" => "application/json"})

    Logger.debug(url)

    case do_post do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        Logger.debug(body)
        {:ok, body}

      {:ok, %HTTPoison.Response{status_code: code, body: body}} ->
        Logger.debug(body)
        {:error, "Request failed HTTP #{code}: #{body}"}

      {:error, %HTTPoison.Error{reason: reason}} ->
        Logger.debug(body)
        {:error, reason}
    end
  end
end
