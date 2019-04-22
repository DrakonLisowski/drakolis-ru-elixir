defmodule Drakolis.Repo.Migrations.CreateSettings do
  use Ecto.Migration

  def change do
    create table(:settings) do
      add :key, :string
      add :string, :string
      add :boolean, :boolean, default: nil, null: true
      add :integer, :integer
      add :float, :float
      add :datetime, :utc_datetime
      add :private, :boolean, default: true, null: false

      timestamps()
    end
    create unique_index(:settings, [:key])
  end
end
