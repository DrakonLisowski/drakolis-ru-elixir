defmodule DrakolisWeb.OperationControllerTest do
  use DrakolisWeb.ConnCase

  alias Drakolis.Budget
  alias Drakolis.Budget.Operation

  @create_attrs %{
    date: ~N[2010-04-17 14:00:00],
    name: "some name",
    sum: 120.5
  }
  @update_attrs %{
    date: ~N[2011-05-18 15:01:01],
    name: "some updated name",
    sum: 456.7
  }
  @invalid_attrs %{date: nil, name: nil, sum: nil}

  def fixture(:operation) do
    {:ok, operation} = Budget.create_operation(@create_attrs)
    operation
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all operations", %{conn: conn} do
      conn = get(conn, Routes.operation_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create operation" do
    test "renders operation when data is valid", %{conn: conn} do
      conn = post(conn, Routes.operation_path(conn, :create), operation: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.operation_path(conn, :show, id))

      assert %{
               "id" => id,
               "date" => "2010-04-17T14:00:00",
               "name" => "some name",
               "sum" => 120.5
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.operation_path(conn, :create), operation: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update operation" do
    setup [:create_operation]

    test "renders operation when data is valid", %{conn: conn, operation: %Operation{id: id} = operation} do
      conn = put(conn, Routes.operation_path(conn, :update, operation), operation: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.operation_path(conn, :show, id))

      assert %{
               "id" => id,
               "date" => "2011-05-18T15:01:01",
               "name" => "some updated name",
               "sum" => 456.7
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, operation: operation} do
      conn = put(conn, Routes.operation_path(conn, :update, operation), operation: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete operation" do
    setup [:create_operation]

    test "deletes chosen operation", %{conn: conn, operation: operation} do
      conn = delete(conn, Routes.operation_path(conn, :delete, operation))
      assert response(conn, 204)

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
