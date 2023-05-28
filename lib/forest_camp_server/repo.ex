defmodule ForestCampServer.Repo do
  use Ecto.Repo,
    otp_app: :forest_camp_server,
    adapter: Ecto.Adapters.Postgres
end
