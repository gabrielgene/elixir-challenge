defmodule ChallengeWeb.Resolvers.Transactions do

  def create_transaction(_parent, args, _resolution) do
    case Challenge.Bank.create_transaction(args) do
      {:ok, transaction} ->
        {:ok, transaction}
      _error ->
        {:error, "could not create transaction"}
      end
  end

end
