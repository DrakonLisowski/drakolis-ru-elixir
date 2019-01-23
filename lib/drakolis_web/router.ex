defmodule DrakolisWeb.Router do
  use DrakolisWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", DrakolisWeb do
    pipe_through :browser

    get "/", PageController, :index
    get "/hello", HelloController, :index
    get "/hello/:messenger", HelloController, :show
    resources "/budget/balances", BalanceController
    resources "/budget/categories", CategoryController
    resources "/budget/operations", OperationController
  end

  # Other scopes may use custom stacks.
  # scope "/api", DrakolisWeb do
  #   pipe_through :api
  # end
end
