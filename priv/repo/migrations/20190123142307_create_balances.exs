defmodule Drakolis.Repo.Migrations.CreateBalances do
  use Ecto.Migration

  def change do
    create table(:balances) do
      add :name, :string
      add :description, :string
      add :icon, :string
      add :owner, :string

      timestamps()
    end

  end
end
