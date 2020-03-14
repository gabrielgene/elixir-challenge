defmodule Challenge.Repo.Migrations.CreateTransaction do
  use Ecto.Migration

  def change do
    create table(:transaction) do
      add :sender, :integer
      add :address, :integer
      add :amount, :float
      add :when, :naive_datetime

      timestamps()
    end

  end
end
