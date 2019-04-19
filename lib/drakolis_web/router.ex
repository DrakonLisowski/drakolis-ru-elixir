defmodule DrakolisWeb.Router do
  use DrakolisWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end
  pipeline :jwt_auth do
    plug Drakolis.Guardian.AuthPipeline
  end

  scope "/api/v1", DrakolisWeb do
    pipe_through :api

    post "/signUp", UserController, :create

    post "/signIn", UserController, :signIn
  end

  scope "/api/v1", DrakolisWeb do
    pipe_through [:api, :jwt_auth]

    get "/me", UserController, :showMe
    resources "/budget/accounts", AccountController, except: [:new, :edit]
    resources "/budget/categories", CategoryController, except: [:new, :edit]
    resources "/budget/operations", OperationController, except: [:new, :edit]
    get "/budget/accounts/:accountId/operations", OperationController, :index_by_account
    resources "/settings", SettingController, except: [:show]
    get "/settings/:key", SettingController, :get_by_key
  end

  scope "/api/v1/external", DrakolisWeb do
    pipe_through [:api]

    get "/lastfm/:user/recent", ExternalApiController, :lastfm_recent
    get "/lastfm/:user/loved", ExternalApiController, :lastfm_loved
  end

end
