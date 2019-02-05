defmodule Drakolis.Budget.Category do
  use Ecto.Schema
  import Ecto.Changeset


  schema "categories" do
    field :color, :string
    field :icon, :string
    field :isIncome, :boolean, default: false
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(category, attrs) do
    category
    |> cast(attrs, [:name, :color, :icon, :isIncome])
    |> validate_required([:name, :color, :icon, :isIncome])
  end
end
