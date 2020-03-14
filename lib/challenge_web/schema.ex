defmodule ChallengeWeb.Schema do
  use Absinthe.Schema

  import_types ChallengeWeb.Schema.AccountTypes

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
  end

end
