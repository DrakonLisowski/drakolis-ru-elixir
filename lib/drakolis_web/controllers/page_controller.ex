defmodule DrakolisWeb.PageController do
  use DrakolisWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
