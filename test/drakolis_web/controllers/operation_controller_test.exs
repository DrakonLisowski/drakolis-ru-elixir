defmodule DrakolisWeb.OperationControllerTest do
  use DrakolisWeb.ConnCase

  alias Drakolis.Budget

  @create_attrs %{description: "some description", isIncome: true, name: "some name"}
  @update_attrs %{description: "some updated description", isIncome: false, name: "some updated name"}
  @invalid_attrs %{description: nil, isIncome: nil, name: nil}

  def fixture(:operation) do
    {:ok, operation} = Budget.create_operation(@create_attrs)
    operation
  end

  describe "index" do
    test "lists all operations", %{conn: conn} do
      conn = get(conn, Routes.operation_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Operations"
    end
  end

  describe "new operation" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.operation_path(conn, :new))
      assert html_response(conn, 200) =~ "New Operation"
    end
  end

  describe "create operation" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.operation_path(conn, :create), operation: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.operation_path(conn, :show, id)

      conn = get(conn, Routes.operation_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Operation"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.operation_path(conn, :create), operation: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Operation"
    end
  end

  describe "edit operation" do
    setup [:create_operation]

    test "renders form for editing chosen operation", %{conn: conn, operation: operation} do
      conn = get(conn, Routes.operation_path(conn, :edit, operation))
      assert html_response(conn, 200) =~ "Edit Operation"
    end
  end

  describe "update operation" do
    setup [:create_operation]

    test "redirects when data is valid", %{conn: conn, operation: operation} do
      conn = put(conn, Routes.operation_path(conn, :update, operation), operation: @update_attrs)
      assert redirected_to(conn) == Routes.operation_path(conn, :show, operation)

      conn = get(conn, Routes.operation_path(conn, :show, operation))
      assert html_response(conn, 200) =~ "some updated description"
    end

    test "renders errors when data is invalid", %{conn: conn, operation: operation} do
      conn = put(conn, Routes.operation_path(conn, :update, operation), operation: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Operation"
    end
  end

  describe "delete operation" do
    setup [:create_operation]

    test "deletes chosen operation", %{conn: conn, operation: operation} do
      conn = delete(conn, Routes.operation_path(conn, :delete, operation))
      assert redirected_to(conn) == Routes.operation_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.operation_path(conn, :show, operation))
      end
    end
  end

  defp create_operation(_) do
    operation = fixture(:operation)
    {:ok, operation: operation}
  end
end
