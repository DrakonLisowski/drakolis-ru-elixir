defmodule Drakolis.Settings.Setting do
  use Ecto.Schema
  import Ecto.Changeset


  schema "settings" do
    field :boolean, :boolean, default: nil
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
    |> validate_required([:key])
    |> validate_required_inclusion([:string, :boolean, :integer, :float, :datetime])
    |> unique_constraint(:key)
  end

  def validate_required_inclusion(changeset, fields) do
    if Enum.any?(fields, &present?(changeset, &1)) do
      changeset
    else
      # Add the error to the first field only since Ecto requires a field name for each error.
      add_error(changeset, hd(fields), "One of these fields must be present: #{inspect fields}")
    end
  end

  def present?(changeset, field) do
    value = get_field(changeset, field)
    value && value != ""
  end
end
