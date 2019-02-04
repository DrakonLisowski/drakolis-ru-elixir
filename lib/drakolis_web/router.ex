defmodule DrakolisWeb.Router do
  use DrakolisWeb, :router

  pipeline :api do
    plug CORSPlug, origin: "*"
    plug :accepts, ["json"]
  end
  pipeline :jwt_auth do
    plug Drakolis.Guardian.AuthPipeline
  end

  scope "/api/v1", DrakolisWeb do
    pipe_through :api

    options "/signUp", UserController, :options
    post "/signUp", UserController, :create

    options "/signIn", UserController, :options
    post "/signIn", UserController, :signIn
  end

  scope "/api/v1", DrakolisWeb do
    pipe_through [:api, :jwt_auth]

    options "/me", UserController, :options
    get "/me", UserController, :showMe
  end
end
