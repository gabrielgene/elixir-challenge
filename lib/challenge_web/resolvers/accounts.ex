defmodule ChanllengeWeb.Resolvers.Accounts do

  def find_account(_parent, %{id: id}, _resolution) do
    case Bank.Bank.find_account(id) do
      nil ->
        {:error, "Account ID #{id} not found"}
      user ->
        {:ok, user}
    end
  end

  def create_account(_parent, %{balance: balance}, _resolution) do
    case Bank.Bank.create_account(%{:current_balance => balance}) do
      {:ok, account} ->
        {:ok, account}

      error ->
        {:error, "Can't create account"}
      end
  end

end
