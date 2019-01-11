defmodule Drakolis.Repo do
  use Ecto.Repo,
    otp_app: :drakolis,
    adapter: Ecto.Adapters.Postgres
end
