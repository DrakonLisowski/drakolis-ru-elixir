defmodule Drakolis.Budget.Account do
  use Ecto.Schema
  import Ecto.Changeset


  schema "accounts" do
    field :currency, :string
    field :name, :string
    field :ownerId, :id

    timestamps()
  end

  @doc false
  def changeset(account, attrs) do
    account
    |> cast(attrs, [:name, :currency])
    |> validate_required([:name, :currency])
  end
end
