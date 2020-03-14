defmodule ChallengeWeb.Schema.AccountTypes do
  use Absinthe.Schema.Notation

  @desc "A account of the bank"
  object :account do
    field :id, :id
    field :current_balance, :float
  end
end
