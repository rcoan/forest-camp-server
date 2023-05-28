defmodule ForestCampServerWeb.MatchController do
  use ForestCampServerWeb, :controller

  alias ForestCampServer.Games
  alias ForestCampServer.Games.Match

  action_fallback ForestCampServerWeb.FallbackController

  def index(conn, _params) do
    matches = Games.list_matches()
    render(conn, :index, matches: matches)
  end

  def create(conn, %{"match" => match_params, "camp_id" => camp_id}) do
    camp = Games.get_camp!(camp_id)

    with {:ok, %Match{} = match} <- Games.create_match(camp, match_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/camps/#{camp_id}/matches/#{match}")
      |> render(:show, match: match)
    end
  end

  def show(conn, %{"id" => id}) do
    match = Games.get_match!(id)
    render(conn, :show, match: match)
  end

  def update(conn, %{"id" => id, "match" => match_params}) do
    match = Games.get_match!(id)

    with {:ok, %Match{} = match} <- Games.update_match(match, match_params) do
      render(conn, :show, match: match)
    end
  end

  def delete(conn, %{"id" => id}) do
    match = Games.get_match!(id)

    with {:ok, %Match{}} <- Games.delete_match(match) do
      send_resp(conn, :no_content, "")
    end
  end
end
