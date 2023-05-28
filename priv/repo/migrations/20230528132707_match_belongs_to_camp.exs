defmodule ForestCampServer.Repo.Migrations.MatchBelongsToCamp do
  use Ecto.Migration

  def change do
    add :camp_id, references(:camps)
  end
end
