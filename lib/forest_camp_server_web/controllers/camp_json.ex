defmodule ForestCampServerWeb.CampJSON do
  alias ForestCampServer.Games.Camp

  @doc """
  Renders a list of camps.
  """
  def index(%{camps: camps}) do
    %{data: for(camp <- camps, do: data(camp))}
  end

  @doc """
  Renders a single camp.
  """
  def show(%{camp: camp}) do
    %{data: data(camp)}
  end

  def data(%Camp{} = camp) do
    %{
      id: camp.id,
      name: camp.name,
      description: camp.description,
      address: camp.address,
      cover_url: camp.cover_url
    }
  end
end
