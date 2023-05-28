defmodule ForestCampServer.Games.Match do
  use Ecto.Schema
  import Ecto.Changeset

  schema "matches" do
    field :description, :string
    field :happens_at, :naive_datetime
    belongs_to :camp, ForestCampServer.Games.Camp

    timestamps()
  end

  @doc false
  def changeset(match, attrs) do
    match
    |> cast(attrs, [:happens_at, :description])
    |> validate_required([:happens_at, :description, :camp])
  end
end
