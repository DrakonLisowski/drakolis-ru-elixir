defmodule Drakolis.Repo.Migrations.CreateSettings do
  use Ecto.Migration

  def change do
    create table(:settings) do
      add :key, :string
      add :string, :string
      add :boolean, :boolean, default: false, null: true
      add :integer, :integer
      add :float, :float
      add :datetime, :utc_datetime

      timestamps()
    end
    create unique_index(:settings, [:key])
  end
end
