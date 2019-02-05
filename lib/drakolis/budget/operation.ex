defmodule Drakolis.Budget.Operation do
  use Ecto.Schema
  import Ecto.Changeset


  schema "operations" do
    field :date, :naive_datetime
    field :name, :string
    field :sum, :float
    field :accountId, :id
    field :categoryId, :id
    field :ownerId, :id

    timestamps()
  end

  @doc false
  def changeset(operation, attrs) do
    operation
    |> cast(attrs, [:name, :sum, :date])
    |> validate_required([:name, :sum, :date])
  end
end
