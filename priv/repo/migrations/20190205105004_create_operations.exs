defmodule Drakolis.Repo.Migrations.CreateOperations do
  use Ecto.Migration

  def change do
    create table(:operations) do
      add :name, :string
      add :sum, :float
      add :date, :naive_datetime
      add :accountId, references(:accounts, on_delete: :nothing)
      add :categoryId, references(:categories, on_delete: :nothing)
      add :ownerId, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:operations, [:accountId])
    create index(:operations, [:categoryId])
    create index(:operations, [:ownerId])
  end
end
