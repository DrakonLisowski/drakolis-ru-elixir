defmodule Drakolis.Repo.Migrations.CreateCategories do
  use Ecto.Migration

  def change do
    create table(:categories) do
      add :name, :string
      add :color, :string
      add :icon, :string
      add :isIncome, :boolean, default: false, null: false

      timestamps()
    end

  end
end
