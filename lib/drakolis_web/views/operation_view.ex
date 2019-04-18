defmodule DrakolisWeb.OperationView do
  use DrakolisWeb, :view
  alias DrakolisWeb.OperationView

  def render("index.json", %{operations: operations}) do
    %{data: render_many(operations, OperationView, "operation.json")}
  end

  def render("show.json", %{operation: operation}) do
    %{data: render_one(operation, OperationView, "operation.json")}
  end

  def render("operation.json", %{operation: operation}) do
    %{
      id: operation.id,
      name: operation.name,
      sum: operation.sum,
      date: operation.date,
      categoryId: operation.categoryId,
      ownerId: operation.ownerId
    }
  end
end
