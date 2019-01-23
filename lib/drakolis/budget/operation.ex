defmodule Drakolis.Budget.Operation do
  use Ecto.Schema
  import Ecto.Changeset


  schema "operations" do
    field :description, :string
    field :isIncome, :boolean, default: false
    field :name, :string
    field :balanceId, :id
    field :categoryId, :id
    field :executor, :string

    timestamps()
  end

  @doc false
  def changeset(operation, attrs) do
    operation
    |> cast(attrs, [:name, :description, :isIncome])
    |> validate_required([:name, :description, :isIncome])
  end
end
