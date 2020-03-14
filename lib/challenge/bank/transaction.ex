defmodule Challenge.Bank.Transaction do
  use Ecto.Schema
  import Ecto.Changeset


  schema "transaction" do
    field :address, :integer
    field :amount, :float
    field :sender, :integer
    field :when, :naive_datetime

    timestamps()
  end

  @doc false
  def changeset(transaction, attrs) do
    transaction
    |> Map.put(:when, DateTime.utc_now)
    |> cast(attrs, [:sender, :address, :amount])
    |> validate_required([:sender, :address, :amount])
  end
end
