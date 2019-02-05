defmodule Drakolis.Repo.Migrations.CreateAccounts do
  use Ecto.Migration

  def change do
    create table(:accounts) do
      add :name, :string
      add :currency, :string
      add :ownerId, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:accounts, [:ownerId])
  end
end
