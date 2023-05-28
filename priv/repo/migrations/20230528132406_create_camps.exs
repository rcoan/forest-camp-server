defmodule ForestCampServer.Repo.Migrations.CreateCamps do
  use Ecto.Migration

  def change do
    create table(:camps) do
      add :name, :string
      add :description, :text
      add :address, :string
      add :cover_url, :string

      timestamps()
    end
  end
end
