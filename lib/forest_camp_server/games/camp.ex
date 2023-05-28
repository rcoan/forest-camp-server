defmodule ForestCampServer.Games.Camp do
  use Ecto.Schema
  import Ecto.Changeset

  schema "camps" do
    field :address, :string
    field :cover_url, :string
    field :description, :string
    field :name, :string
    has_many :matches, ForestCampServer.Games.Match

    timestamps()
  end

  @doc false
  def changeset(camp, attrs) do
    camp
    |> cast(attrs, [:name, :description, :address, :cover_url])
    |> validate_required([:name, :description, :address, :cover_url])
  end
end
