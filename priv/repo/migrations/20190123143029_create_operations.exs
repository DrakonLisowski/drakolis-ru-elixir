defmodule Drakolis.Repo.Migrations.CreateOperations do
  use Ecto.Migration

  def change do
    create table(:operations) do
      add :name, :string
      add :description, :string
      add :isIncome, :boolean, default: false, null: false
      add :balanceId, references(:balances, on_delete: :nothing)
      add :categoryId, references(:categories, on_delete: :nothing)
      add :executor, :string

      timestamps()
    end

    create index(:operations, [:balanceId])
    create index(:operations, [:categoryId])
  end
end
