defmodule Challenge.Bank.Account do
  use Ecto.Schema
  import Ecto.Changeset


  schema "accounts" do
    field :current_balance, :float

    timestamps()
  end

  @doc false
  def changeset(account, attrs) do
    account
    |> cast(attrs, [:current_balance])
    |> validate_required([:current_balance])
    |> validate_number(:current_balance, greater_than_or_equal_to: 0)
  end
end
