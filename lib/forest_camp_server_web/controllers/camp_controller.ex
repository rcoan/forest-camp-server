defmodule ForestCampServerWeb.CampController do
  use ForestCampServerWeb, :controller

  alias ForestCampServer.Games
  alias ForestCampServer.Games.Camp

  action_fallback ForestCampServerWeb.FallbackController

  def index(conn, _params) do
    camps = Games.list_camps()
    render(conn, :index, camps: camps)
  end

  def create(conn, %{"camp" => camp_params}) do
    with {:ok, %Camp{} = camp} <- Games.create_camp(camp_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/camps/#{camp}")
      |> render(:show, camp: camp)
    end
  end

  def show(conn, %{"id" => id}) do
    camp = Games.get_camp!(id)
    render(conn, :show, camp: camp)
  end

  def update(conn, %{"id" => id, "camp" => camp_params}) do
    camp = Games.get_camp!(id)

    with {:ok, %Camp{} = camp} <- Games.update_camp(camp, camp_params) do
      render(conn, :show, camp: camp)
    end
  end

  def delete(conn, %{"id" => id}) do
    camp = Games.get_camp!(id)

    with {:ok, %Camp{}} <- Games.delete_camp(camp) do
      send_resp(conn, :no_content, "")
    end
  end
end
