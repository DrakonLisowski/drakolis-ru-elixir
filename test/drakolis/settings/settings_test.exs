defmodule Drakolis.SettingsTest do
  use Drakolis.DataCase

  alias Drakolis.Settings

  describe "settings" do
    alias Drakolis.Settings.Setting

    @valid_attrs %{boolean: true, datetime: "2010-04-17T14:00:00Z", float: 120.5, integer: 42, key: "some key", string: "some string"}
    @update_attrs %{boolean: false, datetime: "2011-05-18T15:01:01Z", float: 456.7, integer: 43, key: "some updated key", string: "some updated string"}
    @invalid_attrs %{boolean: nil, datetime: nil, float: nil, integer: nil, key: nil, string: nil}

    def setting_fixture(attrs \\ %{}) do
      {:ok, setting} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Settings.create_setting()

      setting
    end

    test "list_settings/0 returns all settings" do
      setting = setting_fixture()
      assert Settings.list_settings() == [setting]
    end

    test "get_setting!/1 returns the setting with given id" do
      setting = setting_fixture()
      assert Settings.get_setting!(setting.id) == setting
    end

    test "create_setting/1 with valid data creates a setting" do
      assert {:ok, %Setting{} = setting} = Settings.create_setting(@valid_attrs)
      assert setting.boolean == true
      assert setting.datetime == DateTime.from_naive!(~N[2010-04-17T14:00:00Z], "Etc/UTC")
      assert setting.float == 120.5
      assert setting.integer == 42
      assert setting.key == "some key"
      assert setting.string == "some string"
    end

    test "create_setting/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Settings.create_setting(@invalid_attrs)
    end

    test "update_setting/2 with valid data updates the setting" do
      setting = setting_fixture()
      assert {:ok, %Setting{} = setting} = Settings.update_setting(setting, @update_attrs)
      assert setting.boolean == false
      assert setting.datetime == DateTime.from_naive!(~N[2011-05-18T15:01:01Z], "Etc/UTC")
      assert setting.float == 456.7
      assert setting.integer == 43
      assert setting.key == "some updated key"
      assert setting.string == "some updated string"
    end

    test "update_setting/2 with invalid data returns error changeset" do
      setting = setting_fixture()
      assert {:error, %Ecto.Changeset{}} = Settings.update_setting(setting, @invalid_attrs)
      assert setting == Settings.get_setting!(setting.id)
    end

    test "delete_setting/1 deletes the setting" do
      setting = setting_fixture()
      assert {:ok, %Setting{}} = Settings.delete_setting(setting)
      assert_raise Ecto.NoResultsError, fn -> Settings.get_setting!(setting.id) end
    end

    test "change_setting/1 returns a setting changeset" do
      setting = setting_fixture()
      assert %Ecto.Changeset{} = Settings.change_setting(setting)
    end
  end
end
