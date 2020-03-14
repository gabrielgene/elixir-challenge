defmodule ChallengeWeb.Resolvers.Transactions do

  def create_transaction(_parent, args, _resolution) do
    case Challenge.Bank.create_transaction(args) do
      {:ok, transaction} ->
        {:ok, transaction}
      _error ->
        {:error, "could not create transaction"}
      end
  end

  def list_transactions(%{id: id}, _args, _resolution) do
    case Challenge.Bank.list_transactions_by_sender_id("#{id}") do
      nil ->
        {:error, "Account ID #{id} not found"}
      transactions ->
        {:ok, transactions}
    end
  end

end
