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
    |> cast(attrs, [:sender, :address, :amount, :when])
    |> validate_required([:sender, :address, :amount, :when])
  end
end
