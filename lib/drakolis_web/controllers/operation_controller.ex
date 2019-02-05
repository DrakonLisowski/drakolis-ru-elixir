defmodule DrakolisWeb.OperationController do
  use DrakolisWeb, :controller

  alias Drakolis.Budget
  alias Drakolis.Budget.Operation

  action_fallback DrakolisWeb.FallbackController

  def index(conn, _params) do
    operations = Budget.list_operations()
    render(conn, "index.json", operations: operations)
  end

  def index_by_account(conn, %{"accountId" => id}) do
    operations = Budget.list_operations_by_account(id)
    render(conn, "index.json", operations: operations)
  end

  def create(conn, %{"operation" => operation_params}) do
    with {:ok, %Operation{} = operation} <- Budget.create_operation(operation_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.operation_path(conn, :show, operation))
      |> render("show.json", operation: operation)
    end
  end

  def show(conn, %{"id" => id}) do
    operation = Budget.get_operation!(id)
    render(conn, "show.json", operation: operation)
  end

  def update(conn, %{"id" => id, "operation" => operation_params}) do
    operation = Budget.get_operation!(id)

    with {:ok, %Operation{} = operation} <- Budget.update_operation(operation, operation_params) do
      render(conn, "show.json", operation: operation)
    end
  end

  def delete(conn, %{"id" => id}) do
    operation = Budget.get_operation!(id)

    with {:ok, %Operation{}} <- Budget.delete_operation(operation) do
      send_resp(conn, :no_content, "")
    end
  end
end
