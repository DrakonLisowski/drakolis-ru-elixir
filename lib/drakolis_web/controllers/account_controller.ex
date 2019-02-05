defmodule DrakolisWeb.AccountController do
  use DrakolisWeb, :controller

  alias Drakolis.Budget
  alias Drakolis.Budget.Account

  action_fallback DrakolisWeb.FallbackController

  def index(conn, _params) do
    accounts = Budget.list_accounts()
    render(conn, "index.json", accounts: accounts)
  end

  def create(conn, %{"account" => account_params}) do
    with {:ok, %Account{} = account} <- Budget.create_account(account_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.account_path(conn, :show, account))
      |> render("show.json", account: account)
    end
  end

  def show(conn, %{"id" => id}) do
    account = Budget.get_account!(id)
    render(conn, "show.json", account: account)
  end

  def update(conn, %{"id" => id, "account" => account_params}) do
    account = Budget.get_account!(id)

    with {:ok, %Account{} = account} <- Budget.update_account(account, account_params) do
      render(conn, "show.json", account: account)
    end
  end

  def delete(conn, %{"id" => id}) do
    account = Budget.get_account!(id)

    with {:ok, %Account{}} <- Budget.delete_account(account) do
      send_resp(conn, :no_content, "")
    end
  end
end
