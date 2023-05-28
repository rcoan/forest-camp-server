defmodule ForestCampServer.Repo.Migrations.CreateMatches do
  use Ecto.Migration

  def change do
    create table(:matches) do
      add :happens_at, :naive_datetime
      add :description, :text
      add :camp_id, references(:camps)

      timestamps()
    end
  end
end
