defmodule Drakolis.Budget.Category do
  use Ecto.Schema
  import Ecto.Changeset


  schema "categories" do
    field :description, :string
    field :icon, :string
    field :isIncome, :boolean, default: false
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(category, attrs) do
    category
    |> cast(attrs, [:name, :description, :icon, :isIncome])
    |> validate_required([:name, :description, :icon, :isIncome])
  end
end
