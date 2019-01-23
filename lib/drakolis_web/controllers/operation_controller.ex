defmodule DrakolisWeb.OperationController do
  use DrakolisWeb, :controller

  alias Drakolis.Budget
  alias Drakolis.Budget.Operation

  def index(conn, _params) do
    operations = Budget.list_operations()
    render(conn, "index.html", operations: operations)
  end

  def new(conn, _params) do
    changeset = Budget.change_operation(%Operation{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"operation" => operation_params}) do
    case Budget.create_operation(operation_params) do
      {:ok, operation} ->
        conn
        |> put_flash(:info, "Operation created successfully.")
        |> redirect(to: Routes.operation_path(conn, :show, operation))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    operation = Budget.get_operation!(id)
    render(conn, "show.html", operation: operation)
  end

  def edit(conn, %{"id" => id}) do
    operation = Budget.get_operation!(id)
    changeset = Budget.change_operation(operation)
    render(conn, "edit.html", operation: operation, changeset: changeset)
  end

  def update(conn, %{"id" => id, "operation" => operation_params}) do
    operation = Budget.get_operation!(id)

    case Budget.update_operation(operation, operation_params) do
      {:ok, operation} ->
        conn
        |> put_flash(:info, "Operation updated successfully.")
        |> redirect(to: Routes.operation_path(conn, :show, operation))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", operation: operation, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    operation = Budget.get_operation!(id)
    {:ok, _operation} = Budget.delete_operation(operation)

    conn
    |> put_flash(:info, "Operation deleted successfully.")
    |> redirect(to: Routes.operation_path(conn, :index))
  end
end
