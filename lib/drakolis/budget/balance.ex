defmodule Drakolis.Budget.Balance do
  use Ecto.Schema
  import Ecto.Changeset


  schema "balances" do
    field :description, :string
    field :icon, :string
    field :name, :string
    field :owner, :string

    timestamps()
  end

  @doc false
  def changeset(balance, attrs) do
    balance
    |> cast(attrs, [:name, :description, :icon])
    |> validate_required([:name, :description, :icon])
  end
end
