defmodule Challenge.BankTest do
  use Challenge.DataCase

  alias Challenge.Bank

  describe "accounts" do
    alias Challenge.Bank.Account

    @valid_attrs %{current_balance: 120.5}
    @update_attrs %{current_balance: 456.7}
    @invalid_attrs %{current_balance: nil}

    def account_fixture(attrs \\ %{}) do
      {:ok, account} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Bank.create_account()

      account
    end

    test "list_accounts/0 returns all accounts" do
      account = account_fixture()
      assert Bank.list_accounts() == [account]
    end

    test "get_account!/1 returns the account with given id" do
      account = account_fixture()
      assert Bank.get_account!(account.id) == account
    end

    test "create_account/1 with valid data creates a account" do
      assert {:ok, %Account{} = account} = Bank.create_account(@valid_attrs)
      assert account.current_balance == 120.5
    end

    test "create_account/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Bank.create_account(@invalid_attrs)
    end

    test "update_account/2 with valid data updates the account" do
      account = account_fixture()
      assert {:ok, account} = Bank.update_account(account, @update_attrs)
      assert %Account{} = account
      assert account.current_balance == 456.7
    end

    test "update_account/2 with invalid data returns error changeset" do
      account = account_fixture()
      assert {:error, %Ecto.Changeset{}} = Bank.update_account(account, @invalid_attrs)
      assert account == Bank.get_account!(account.id)
    end

    test "delete_account/1 deletes the account" do
      account = account_fixture()
      assert {:ok, %Account{}} = Bank.delete_account(account)
      assert_raise Ecto.NoResultsError, fn -> Bank.get_account!(account.id) end
    end

    test "change_account/1 returns a account changeset" do
      account = account_fixture()
      assert %Ecto.Changeset{} = Bank.change_account(account)
    end
  end

  describe "transaction" do
    alias Challenge.Bank.Transaction

    @valid_attrs %{address: 42, amount: 120.5, sender: 42, when: ~N[2010-04-17 14:00:00.000000]}
    @update_attrs %{address: 43, amount: 456.7, sender: 43, when: ~N[2011-05-18 15:01:01.000000]}
    @invalid_attrs %{address: nil, amount: nil, sender: nil, when: nil}

    def transaction_fixture(attrs \\ %{}) do
      {:ok, transaction} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Bank.create_transaction()

      transaction
    end

    test "list_transaction/0 returns all transaction" do
      transaction = transaction_fixture()
      assert Bank.list_transaction() == [transaction]
    end

    test "get_transaction!/1 returns the transaction with given id" do
      transaction = transaction_fixture()
      assert Bank.get_transaction!(transaction.id) == transaction
    end

    test "create_transaction/1 with valid data creates a transaction" do
      assert {:ok, %Transaction{} = transaction} = Bank.create_transaction(@valid_attrs)
      assert transaction.address == 42
      assert transaction.amount == 120.5
      assert transaction.sender == 42
      assert transaction.when == ~N[2010-04-17 14:00:00.000000]
    end

    test "create_transaction/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Bank.create_transaction(@invalid_attrs)
    end

    test "update_transaction/2 with valid data updates the transaction" do
      transaction = transaction_fixture()
      assert {:ok, transaction} = Bank.update_transaction(transaction, @update_attrs)
      assert %Transaction{} = transaction
      assert transaction.address == 43
      assert transaction.amount == 456.7
      assert transaction.sender == 43
      assert transaction.when == ~N[2011-05-18 15:01:01.000000]
    end

    test "update_transaction/2 with invalid data returns error changeset" do
      transaction = transaction_fixture()
      assert {:error, %Ecto.Changeset{}} = Bank.update_transaction(transaction, @invalid_attrs)
      assert transaction == Bank.get_transaction!(transaction.id)
    end

    test "delete_transaction/1 deletes the transaction" do
      transaction = transaction_fixture()
      assert {:ok, %Transaction{}} = Bank.delete_transaction(transaction)
      assert_raise Ecto.NoResultsError, fn -> Bank.get_transaction!(transaction.id) end
    end

    test "change_transaction/1 returns a transaction changeset" do
      transaction = transaction_fixture()
      assert %Ecto.Changeset{} = Bank.change_transaction(transaction)
    end
  end
end
