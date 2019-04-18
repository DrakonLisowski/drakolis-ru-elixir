defmodule Drakolis.Settings.Setting do
  use Ecto.Schema
  import Ecto.Changeset


  schema "settings" do
    field :boolean, :boolean, default: false
    field :datetime, :utc_datetime
    field :float, :float
    field :integer, :integer
    field :key, :string
    field :string, :string

    timestamps()
  end

  @doc false
  def changeset(setting, attrs) do
    setting
    |> cast(attrs, [:key, :string, :boolean, :integer, :float, :datetime])
    |> validate_required([:key, :string, :boolean, :integer, :float, :datetime])
  end
end
