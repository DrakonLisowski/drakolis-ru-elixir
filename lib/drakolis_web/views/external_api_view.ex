defmodule DrakolisWeb.ExternalApiView do
  use DrakolisWeb, :view
  alias DrakolisWeb.ExternalApiView

  def render("lastfm_recent.json", %{resp: resp}) do
    %{
      recent: resp["recenttracks"]["track"]
    }
  end
end
