defmodule ForestCampServer.GamesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `ForestCampServer.Games` context.
  """

  @doc """
  Generate a match.
  """
  def match_fixture(attrs \\ %{}) do
    {:ok, match} =
      attrs
      |> Enum.into(%{
        description: "some description",
        happens_at: ~N[2023-05-27 13:22:00]
      })
      |> ForestCampServer.Games.create_match()

    match
  end

  @doc """
  Generate a camp.
  """
  def camp_fixture(attrs \\ %{}) do
    {:ok, camp} =
      attrs
      |> Enum.into(%{
        address: "some address",
        cover_url: "some cover_url",
        description: "some description",
        name: "some name"
      })
      |> ForestCampServer.Games.create_camp()

    camp
  end
end
