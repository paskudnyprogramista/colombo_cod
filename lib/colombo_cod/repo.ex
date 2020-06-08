defmodule ColomboCodModule.Repo do
  use Ecto.Repo,
    otp_app: :colombo_cod,
    adapter: Ecto.Adapters.Postgres
end
