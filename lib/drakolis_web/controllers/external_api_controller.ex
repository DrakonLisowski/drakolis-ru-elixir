defmodule DrakolisWeb.ExternalApiController do
  use DrakolisWeb, :controller

  alias Drakolis.Settings
  #alias Drakolis.Settings.Setting

  action_fallback DrakolisWeb.FallbackController

  defp api_key() do
    Settings.get_setting_by_key("lasftm.key").string
  end

  defp proxy_request_lastfm(conn, url) do
    response = HTTPoison.get!(url)
    req = Poison.decode!(response.body)
    render(conn, "lastfm_tracks.json", tracks: req["recenttracks"])
  end

  def lastfm_recent(conn, %{"user" => user}) do
    url = "http://ws.audioscrobbler.com/2.0/?method=user.getrecenttracks&user=#{user}&limit=10&api_key=#{api_key()}&format=json"
    proxy_request_lastfm(conn, url)
  end

  def lastfm_loved(conn, %{"user" => user}) do
    url = "http://ws.audioscrobbler.com/2.0/?method=user.getlovedtracks&user=#{user}&limit=10&api_key=#{api_key()}&format=json"
    proxy_request_lastfm(conn, url)
  end
end
