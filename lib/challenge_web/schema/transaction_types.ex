defmodule ChallengeWeb.Schema.TransactionTypes do
  use Absinthe.Schema.Notation

  @desc "A transaction between accounts"
  object :transaction do
    field :id, :id
    field :address, :integer
    field :amount, :float
    field :when, :naive_datetime
  end
end
