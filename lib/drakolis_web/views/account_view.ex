defmodule DrakolisWeb.AccountView do
  use DrakolisWeb, :view
  alias DrakolisWeb.AccountView

  def render("index.json", %{accounts: accounts}) do
    %{data: render_many(accounts, AccountView, "account.json")}
  end

  def render("show.json", %{account: account}) do
    %{data: render_one(account, AccountView, "account.json")}
  end

  def render("account.json", %{account: account}) do
    %{id: account.id,
      name: account.name,
      currency: account.currency,
      balance: account.balance
    }
  end
end
