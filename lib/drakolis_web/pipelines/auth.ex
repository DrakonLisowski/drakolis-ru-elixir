defmodule Drakolis.Guardian.AuthPipeline do
  use Guardian.Plug.Pipeline, otp_app: :drakolis,
  module: Drakolis.Guardian,
  error_handler: Drakolis.AuthErrorHandler

  plug Guardian.Plug.VerifyHeader, realm: "Bearer"
  plug Guardian.Plug.EnsureAuthenticated
  plug Guardian.Plug.LoadResource
end
