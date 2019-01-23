defmodule Drakolis.BudgetTest do
  use Drakolis.DataCase

  alias Drakolis.Budget

  describe "balances" do
    alias Drakolis.Budget.Balance

    @valid_attrs %{description: "some description", icon: "some icon", name: "some name"}
    @update_attrs %{description: "some updated description", icon: "some updated icon", name: "some updated name"}
    @invalid_attrs %{description: nil, icon: nil, name: nil}

    def balance_fixture(attrs \\ %{}) do
      {:ok, balance} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Budget.create_balance()

      balance
    end

    test "list_balances/0 returns all balances" do
      balance = balance_fixture()
      assert Budget.list_balances() == [balance]
    end

    test "get_balance!/1 returns the balance with given id" do
      balance = balance_fixture()
      assert Budget.get_balance!(balance.id) == balance
    end

    test "create_balance/1 with valid data creates a balance" do
      assert {:ok, %Balance{} = balance} = Budget.create_balance(@valid_attrs)
      assert balance.description == "some description"
      assert balance.icon == "some icon"
      assert balance.name == "some name"
    end

    test "create_balance/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Budget.create_balance(@invalid_attrs)
    end

    test "update_balance/2 with valid data updates the balance" do
      balance = balance_fixture()
      assert {:ok, %Balance{} = balance} = Budget.update_balance(balance, @update_attrs)
      assert balance.description == "some updated description"
      assert balance.icon == "some updated icon"
      assert balance.name == "some updated name"
    end

    test "update_balance/2 with invalid data returns error changeset" do
      balance = balance_fixture()
      assert {:error, %Ecto.Changeset{}} = Budget.update_balance(balance, @invalid_attrs)
      assert balance == Budget.get_balance!(balance.id)
    end

    test "delete_balance/1 deletes the balance" do
      balance = balance_fixture()
      assert {:ok, %Balance{}} = Budget.delete_balance(balance)
      assert_raise Ecto.NoResultsError, fn -> Budget.get_balance!(balance.id) end
    end

    test "change_balance/1 returns a balance changeset" do
      balance = balance_fixture()
      assert %Ecto.Changeset{} = Budget.change_balance(balance)
    end
  end

  describe "categories" do
    alias Drakolis.Budget.Category

    @valid_attrs %{description: "some description", icon: "some icon", isIncome: true, name: "some name"}
    @update_attrs %{description: "some updated description", icon: "some updated icon", isIncome: false, name: "some updated name"}
    @invalid_attrs %{description: nil, icon: nil, isIncome: nil, name: nil}

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
      assert category.description == "some description"
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
      assert category.description == "some updated description"
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

    @valid_attrs %{description: "some description", isIncome: true, name: "some name"}
    @update_attrs %{description: "some updated description", isIncome: false, name: "some updated name"}
    @invalid_attrs %{description: nil, isIncome: nil, name: nil}

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
      assert operation.description == "some description"
      assert operation.isIncome == true
      assert operation.name == "some name"
    end

    test "create_operation/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Budget.create_operation(@invalid_attrs)
    end

    test "update_operation/2 with valid data updates the operation" do
      operation = operation_fixture()
      assert {:ok, %Operation{} = operation} = Budget.update_operation(operation, @update_attrs)
      assert operation.description == "some updated description"
      assert operation.isIncome == false
      assert operation.name == "some updated name"
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
