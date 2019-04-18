defmodule DrakolisWeb.SettingControllerTest do
  use DrakolisWeb.ConnCase

  alias Drakolis.Settings
  alias Drakolis.Settings.Setting

  @create_attrs %{
    boolean: true,
    datetime: "2010-04-17T14:00:00Z",
    float: 120.5,
    integer: 42,
    key: "some key",
    string: "some string"
  }
  @update_attrs %{
    boolean: false,
    datetime: "2011-05-18T15:01:01Z",
    float: 456.7,
    integer: 43,
    key: "some updated key",
    string: "some updated string"
  }
  @invalid_attrs %{boolean: nil, datetime: nil, float: nil, integer: nil, key: nil, string: nil}

  def fixture(:setting) do
    {:ok, setting} = Settings.create_setting(@create_attrs)
    setting
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all settings", %{conn: conn} do
      conn = get(conn, Routes.setting_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create setting" do
    test "renders setting when data is valid", %{conn: conn} do
      conn = post(conn, Routes.setting_path(conn, :create), setting: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.setting_path(conn, :show, id))

      assert %{
               "id" => id,
               "boolean" => true,
               "datetime" => "2010-04-17T14:00:00Z",
               "float" => 120.5,
               "integer" => 42,
               "key" => "some key",
               "string" => "some string"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.setting_path(conn, :create), setting: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update setting" do
    setup [:create_setting]

    test "renders setting when data is valid", %{conn: conn, setting: %Setting{id: id} = setting} do
      conn = put(conn, Routes.setting_path(conn, :update, setting), setting: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.setting_path(conn, :show, id))

      assert %{
               "id" => id,
               "boolean" => false,
               "datetime" => "2011-05-18T15:01:01Z",
               "float" => 456.7,
               "integer" => 43,
               "key" => "some updated key",
               "string" => "some updated string"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, setting: setting} do
      conn = put(conn, Routes.setting_path(conn, :update, setting), setting: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete setting" do
    setup [:create_setting]

    test "deletes chosen setting", %{conn: conn, setting: setting} do
      conn = delete(conn, Routes.setting_path(conn, :delete, setting))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.setting_path(conn, :show, setting))
      end
    end
  end

  defp create_setting(_) do
    setting = fixture(:setting)
    {:ok, setting: setting}
  end
end
