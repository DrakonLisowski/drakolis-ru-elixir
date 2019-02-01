defmodule DrakolisWeb.Router do
  use DrakolisWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", DrakolisWeb do
    pipe_through :api
  end
end
