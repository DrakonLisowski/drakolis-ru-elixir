defmodule DrakolisWeb.ExternalApiController do
  use DrakolisWeb, :controller

  alias Drakolis.Settings
  alias Drakolis.Settings.Setting

  action_fallback DrakolisWeb.FallbackController

  defp api_key() do
    setting = Settings.get_setting_by_key("lasftm.key").string
  end

  def lastfm_recent(conn, %{"user" => user}) do
    url = "http://ws.audioscrobbler.com/2.0/?method=user.getrecenttracks&user=#{user}&limit=10&api_key=#{api_key}&format=json"

    response = HTTPoison.get!(url)
    req = Poison.decode!(response.body)
    render(conn, "lastfm_recent.json", resp: req)
  end
end
