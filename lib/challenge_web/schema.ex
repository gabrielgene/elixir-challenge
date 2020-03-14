defmodule ChallengeWeb.Schema do
  use Absinthe.Schema

  import_types Absinthe.Type.Custom
  import_types ChallengeWeb.Schema.AccountTypes
  import_types ChallengeWeb.Schema.TransactionTypes

  alias ChallengeWeb.Resolvers

  query do
    @desc "Get account by id"
    field :account, :account do
      arg :id, non_null(:id)
      resolve &Resolvers.Accounts.find_account/3
    end
  end

  mutation do
    @desc "Create an account with balance"
    field :open_account, :account do
      arg :balance, non_null(:float)
      resolve &Resolvers.Accounts.create_account/3
    end

    @desc "Create a transaction"
    field :transfer_money, :transaction do
      arg :sender, non_null(:id)
      arg :address, non_null(:id)
      arg :amount, non_null(:float)

      resolve &Resolvers.Transactions.create_transaction/3
    end
  end

end
