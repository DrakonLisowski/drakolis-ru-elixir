defmodule Drakolis.BudgetTest do
  use Drakolis.DataCase

  alias Drakolis.Budget

  describe "accounts" do
    alias Drakolis.Budget.Account

    @valid_attrs %{currency: "some currency", name: "some name"}
    @update_attrs %{currency: "some updated currency", name: "some updated name"}
    @invalid_attrs %{currency: nil, name: nil}

    def account_fixture(attrs \\ %{}) do
      {:ok, account} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Budget.create_account()

      account
    end

    test "list_accounts/0 returns all accounts" do
      account = account_fixture()
      assert Budget.list_accounts() == [account]
    end

    test "get_account!/1 returns the account with given id" do
      account = account_fixture()
      assert Budget.get_account!(account.id) == account
    end

    test "create_account/1 with valid data creates a account" do
      assert {:ok, %Account{} = account} = Budget.create_account(@valid_attrs)
      assert account.currency == "some currency"
      assert account.name == "some name"
    end

    test "create_account/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Budget.create_account(@invalid_attrs)
    end

    test "update_account/2 with valid data updates the account" do
      account = account_fixture()
      assert {:ok, %Account{} = account} = Budget.update_account(account, @update_attrs)
      assert account.currency == "some updated currency"
      assert account.name == "some updated name"
    end

    test "update_account/2 with invalid data returns error changeset" do
      account = account_fixture()
      assert {:error, %Ecto.Changeset{}} = Budget.update_account(account, @invalid_attrs)
      assert account == Budget.get_account!(account.id)
    end

    test "delete_account/1 deletes the account" do
      account = account_fixture()
      assert {:ok, %Account{}} = Budget.delete_account(account)
      assert_raise Ecto.NoResultsError, fn -> Budget.get_account!(account.id) end
    end

    test "change_account/1 returns a account changeset" do
      account = account_fixture()
      assert %Ecto.Changeset{} = Budget.change_account(account)
    end
  end

  describe "categories" do
    alias Drakolis.Budget.Category

    @valid_attrs %{color: "some color", icon: "some icon", isIncome: true, name: "some name"}
    @update_attrs %{color: "some updated color", icon: "some updated icon", isIncome: false, name: "some updated name"}
    @invalid_attrs %{color: nil, icon: nil, isIncome: nil, name: nil}

    def category_fixture(attrs \\ %{}) do
      {:ok, category} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Budget.create_category()

      category
    end

    test "list_categories/0 returns all categories" do
      category = category_fixture()
      assert Budget.list_categories() == [category]
    end

    test "get_category!/1 returns the category with given id" do
      category = category_fixture()
      assert Budget.get_category!(category.id) == category
    end

    test "create_category/1 with valid data creates a category" do
      assert {:ok, %Category{} = category} = Budget.create_category(@valid_attrs)
      assert category.color == "some color"
      assert category.icon == "some icon"
      assert category.isIncome == true
      assert category.name == "some name"
    end

    test "create_category/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Budget.create_category(@invalid_attrs)
    end

    test "update_category/2 with valid data updates the category" do
      category = category_fixture()
      assert {:ok, %Category{} = category} = Budget.update_category(category, @update_attrs)
      assert category.color == "some updated color"
      assert category.icon == "some updated icon"
      assert category.isIncome == false
      assert category.name == "some updated name"
    end

    test "update_category/2 with invalid data returns error changeset" do
      category = category_fixture()
      assert {:error, %Ecto.Changeset{}} = Budget.update_category(category, @invalid_attrs)
      assert category == Budget.get_category!(category.id)
    end

    test "delete_category/1 deletes the category" do
      category = category_fixture()
      assert {:ok, %Category{}} = Budget.delete_category(category)
      assert_raise Ecto.NoResultsError, fn -> Budget.get_category!(category.id) end
    end

    test "change_category/1 returns a category changeset" do
      category = category_fixture()
      assert %Ecto.Changeset{} = Budget.change_category(category)
    end
  end

  describe "operations" do
    alias Drakolis.Budget.Operation

    @valid_attrs %{date: ~N[2010-04-17 14:00:00], name: "some name", sum: 120.5}
    @update_attrs %{date: ~N[2011-05-18 15:01:01], name: "some updated name", sum: 456.7}
    @invalid_attrs %{date: nil, name: nil, sum: nil}

    def operation_fixture(attrs \\ %{}) do
      {:ok, operation} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Budget.create_operation()

      operation
    end

    test "list_operations/0 returns all operations" do
      operation = operation_fixture()
      assert Budget.list_operations() == [operation]
    end

    test "get_operation!/1 returns the operation with given id" do
      operation = operation_fixture()
      assert Budget.get_operation!(operation.id) == operation
    end

    test "create_operation/1 with valid data creates a operation" do
      assert {:ok, %Operation{} = operation} = Budget.create_operation(@valid_attrs)
      assert operation.date == ~N[2010-04-17 14:00:00]
      assert operation.name == "some name"
      assert operation.sum == 120.5
    end

    test "create_operation/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Budget.create_operation(@invalid_attrs)
    end

    test "update_operation/2 with valid data updates the operation" do
      operation = operation_fixture()
      assert {:ok, %Operation{} = operation} = Budget.update_operation(operation, @update_attrs)
      assert operation.date == ~N[2011-05-18 15:01:01]
      assert operation.name == "some updated name"
      assert operation.sum == 456.7
    end

    test "update_operation/2 with invalid data returns error changeset" do
      operation = operation_fixture()
      assert {:error, %Ecto.Changeset{}} = Budget.update_operation(operation, @invalid_attrs)
      assert operation == Budget.get_operation!(operation.id)
    end

    test "delete_operation/1 deletes the operation" do
      operation = operation_fixture()
      assert {:ok, %Operation{}} = Budget.delete_operation(operation)
      assert_raise Ecto.NoResultsError, fn -> Budget.get_operation!(operation.id) end
    end

    test "change_operation/1 returns a operation changeset" do
      operation = operation_fixture()
      assert %Ecto.Changeset{} = Budget.change_operation(operation)
    end
  end
end
