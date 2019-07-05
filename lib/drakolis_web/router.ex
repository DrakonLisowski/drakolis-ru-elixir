defmodule DrakolisWeb.Router do
  use DrakolisWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end
  pipeline :jwt_auth do
    plug Drakolis.Guardian.AuthPipeline
  end

  scope "/v1/public", DrakolisWeb do
    pipe_through :api

    # Accounts
    post "/signUp", UserController, :create
    post "/signIn", UserController, :signIn
    get "/signUp", UserController, :createGet

    # Settings
    get "/settings", SettingController, :index_public
  end

  scope "/v1/private", DrakolisWeb do
    pipe_through [:api, :jwt_auth]

    # Accounts
    get "/me", UserController, :showMe

    resources "/budget/accounts", AccountController#, except: [:new, :edit]
    resources "/budget/categories", CategoryController#, except: [:new, :edit]
    resources "/budget/operations", OperationController#, except: [:new, :edit]
    get "/budget/accounts/:accountId/operations", OperationController, :index_by_account

    # Settings
    resources "/settings", SettingController, except: [:show, :new, :edit, :delete]
    get "/settings/:key", SettingController, :show_by_key
  end

  scope "/v1/proxy", DrakolisWeb do
    pipe_through :api

    # LastFM
    get "/lastfm/:user/recent", ExternalApiController, :lastfm_recent
    get "/lastfm/:user/loved", ExternalApiController, :lastfm_loved
  end

  scope "/v1/secured", DrakolisWeb do
    pipe_through [:api, :jwt_auth]
  end
end
