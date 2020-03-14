defmodule ChallengeWeb.Resolvers.Accounts do

  def find_account(_parent, %{id: id}, _resolution) do
    case Challenge.Bank.find_account(id) do
      nil ->
        {:error, "Account ID #{id} not found"}
      user ->
        {:ok, user}
    end
  end

  def create_account(_parent, %{balance: balance}, _resolution) do
    case Challenge.Bank.create_account(%{:current_balance => balance}) do
      {:ok, account} ->
        {:ok, account}

      {:error, changeset} ->
        {message, _value} = changeset.errors[:current_balance]
        {:error, message}
      end
  end

end
