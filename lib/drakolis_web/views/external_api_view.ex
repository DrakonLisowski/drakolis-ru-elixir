defmodule DrakolisWeb.ExternalApiView do
  use DrakolisWeb, :view
  alias DrakolisWeb.ExternalApiView

  def render("lastfm_tracks.json", %{tracks: tracks}) do
    %{
      tracks: tracks["track"]
    }
  end
end
