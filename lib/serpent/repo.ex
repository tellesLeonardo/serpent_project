defmodule Serpent.Repo do
  use Ecto.Repo,
    otp_app: :serpent,
    adapter: Ecto.Adapters.Postgres
end
