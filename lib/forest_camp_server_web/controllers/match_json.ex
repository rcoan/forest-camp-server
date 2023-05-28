defmodule ForestCampServerWeb.MatchJSON do
  alias ForestCampServer.Games.Match

  @doc """
  Renders a list of matches.
  """
  def index(%{matches: matches}) do
    %{data: for(match <- matches, do: data(match))}
  end

  @doc """
  Renders a single match.
  """
  def show(%{match: match}) do
    %{data: data(match)}
  end

  defp data(%Match{} = match) do
    %{
      id: match.id,
      happens_at: match.happens_at,
      description: match.description,
      camp: ForestCampServerWeb.CampJSON.data(match.camp)
    }
  end
end
