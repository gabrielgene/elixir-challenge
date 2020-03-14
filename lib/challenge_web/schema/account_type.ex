defmodule ChallengeWeb.Schema.AccountTypes do
  use Absinthe.Schema.Notation

  alias ChallengeWeb.Resolvers

  @desc "A account of the bank"
  object :account do
    field :id, :id
    field :current_balance, :float
    field :transactions, list_of(:transaction) do
      resolve &Resolvers.Transactions.list_transactions/3
    end
  end
end
