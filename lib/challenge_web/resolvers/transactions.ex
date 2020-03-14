defmodule ChallengeWeb.Resolvers.Transactions do

  def create_transaction(_parent, %{sender: sender, address: address, amount: amount}, _resolution) do
    try do
      if sender === address do
        {:error, "Sender and address dont should be the same"}
      end

      sender_account = case Challenge.Bank.find_account(sender) do
        nil ->
          raise "Account ID #{sender} not found"
        user -> user
      end

      if sender_account.current_balance < amount do
        raise "Insufficient amount of money in the sender account #{sender_account.id}"
      end

      address_account = case Challenge.Bank.find_account(address) do
        nil ->
          raise "Account ID #{address} not found"
        user -> user
      end

      case Challenge.Bank.update_account(sender_account, %{current_balance: sender_account.current_balance - amount}) do
        nil -> raise "Error on update sender account #{sender_account.id}"
        user -> user
      end

      case Challenge.Bank.update_account(address_account, %{current_balance: address_account.current_balance + amount}) do
        nil -> raise "Error on update address account #{address_account.id}"
        user -> user
      end

      case Challenge.Bank.create_transaction(%{sender: sender, amount: amount, address: address}) do
        {:ok, transaction} ->
          {:ok, transaction}
        _error ->
          {:error, "Could not create transaction"}
      end

    rescue
      e in RuntimeError -> {:error, "#{e.message}"}
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
