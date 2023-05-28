defmodule ForestCampServerWeb.CampControllerTest do
  use ForestCampServerWeb.ConnCase

  import ForestCampServer.GamesFixtures

  alias ForestCampServer.Games.Camp

  @create_attrs %{
    address: "some address",
    cover_url: "some cover_url",
    description: "some description",
    name: "some name"
  }
  @update_attrs %{
    address: "some updated address",
    cover_url: "some updated cover_url",
    description: "some updated description",
    name: "some updated name"
  }
  @invalid_attrs %{address: nil, cover_url: nil, description: nil, name: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all camps", %{conn: conn} do
      conn = get(conn, ~p"/api/camps")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create camp" do
    test "renders camp when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/camps", camp: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/camps/#{id}")

      assert %{
               "id" => ^id,
               "address" => "some address",
               "cover_url" => "some cover_url",
               "description" => "some description",
               "name" => "some name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/camps", camp: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update camp" do
    setup [:create_camp]

    test "renders camp when data is valid", %{conn: conn, camp: %Camp{id: id} = camp} do
      conn = put(conn, ~p"/api/camps/#{camp}", camp: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/camps/#{id}")

      assert %{
               "id" => ^id,
               "address" => "some updated address",
               "cover_url" => "some updated cover_url",
               "description" => "some updated description",
               "name" => "some updated name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, camp: camp} do
      conn = put(conn, ~p"/api/camps/#{camp}", camp: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete camp" do
    setup [:create_camp]

    test "deletes chosen camp", %{conn: conn, camp: camp} do
      conn = delete(conn, ~p"/api/camps/#{camp}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/camps/#{camp}")
      end
    end
  end

  defp create_camp(_) do
    camp = camp_fixture()
    %{camp: camp}
  end
end
