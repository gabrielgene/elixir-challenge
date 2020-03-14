defmodule Challenge.Repo.Migrations.CreateAccounts do
  use Ecto.Migration

  def change do
    create table(:accounts) do
      add :current_balance, :float

      timestamps()
    end

  end
end
