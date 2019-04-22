defmodule DrakolisWeb.SettingView do
  use DrakolisWeb, :view
  alias DrakolisWeb.SettingView

  def render("index.json", %{settings: settings}) do
    %{data: render_many(settings, SettingView, "setting.json")}
  end

  def render("index_public.json", %{settings: settings}) do
    %{data: render_many(settings, SettingView, "setting_public.json")}
  end

  def render("show.json", %{setting: setting}) do
    %{data: render_one(setting, SettingView, "setting.json")}
  end

  def render("setting.json", %{setting: setting}) do
    %{id: setting.id,
      key: setting.key,
      string: setting.string,
      boolean: setting.boolean,
      integer: setting.integer,
      float: setting.float,
      datetime: setting.datetime,
      private: setting.private}
  end

  def render("setting_public.json", %{setting: setting}) do
    %{key: setting.key,
      string: setting.string,
      boolean: setting.boolean,
      integer: setting.integer,
      float: setting.float,
      datetime: setting.datetime}
  end
end
