defmodule ForestCampServer.GamesTest do
  use ForestCampServer.DataCase

  alias ForestCampServer.Games

  describe "matches" do
    alias ForestCampServer.Games.Match

    import ForestCampServer.GamesFixtures

    @invalid_attrs %{description: nil, happens_at: nil}

    test "list_matches/0 returns all matches" do
      match = match_fixture()
      assert Games.list_matches() == [match]
    end

    test "get_match!/1 returns the match with given id" do
      match = match_fixture()
      assert Games.get_match!(match.id) == match
    end

    test "create_match/1 with valid data creates a match" do
      valid_attrs = %{description: "some description", happens_at: ~N[2023-05-27 13:22:00]}

      assert {:ok, %Match{} = match} = Games.create_match(valid_attrs)
      assert match.description == "some description"
      assert match.happens_at == ~N[2023-05-27 13:22:00]
    end

    test "create_match/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Games.create_match(@invalid_attrs)
    end

    test "update_match/2 with valid data updates the match" do
      match = match_fixture()
      update_attrs = %{description: "some updated description", happens_at: ~N[2023-05-28 13:22:00]}

      assert {:ok, %Match{} = match} = Games.update_match(match, update_attrs)
      assert match.description == "some updated description"
      assert match.happens_at == ~N[2023-05-28 13:22:00]
    end

    test "update_match/2 with invalid data returns error changeset" do
      match = match_fixture()
      assert {:error, %Ecto.Changeset{}} = Games.update_match(match, @invalid_attrs)
      assert match == Games.get_match!(match.id)
    end

    test "delete_match/1 deletes the match" do
      match = match_fixture()
      assert {:ok, %Match{}} = Games.delete_match(match)
      assert_raise Ecto.NoResultsError, fn -> Games.get_match!(match.id) end
    end

    test "change_match/1 returns a match changeset" do
      match = match_fixture()
      assert %Ecto.Changeset{} = Games.change_match(match)
    end
  end

  describe "camps" do
    alias ForestCampServer.Games.Camp

    import ForestCampServer.GamesFixtures

    @invalid_attrs %{address: nil, cover_url: nil, description: nil, name: nil}

    test "list_camps/0 returns all camps" do
      camp = camp_fixture()
      assert Games.list_camps() == [camp]
    end

    test "get_camp!/1 returns the camp with given id" do
      camp = camp_fixture()
      assert Games.get_camp!(camp.id) == camp
    end

    test "create_camp/1 with valid data creates a camp" do
      valid_attrs = %{address: "some address", cover_url: "some cover_url", description: "some description", name: "some name"}

      assert {:ok, %Camp{} = camp} = Games.create_camp(valid_attrs)
      assert camp.address == "some address"
      assert camp.cover_url == "some cover_url"
      assert camp.description == "some description"
      assert camp.name == "some name"
    end

    test "create_camp/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Games.create_camp(@invalid_attrs)
    end

    test "update_camp/2 with valid data updates the camp" do
      camp = camp_fixture()
      update_attrs = %{address: "some updated address", cover_url: "some updated cover_url", description: "some updated description", name: "some updated name"}

      assert {:ok, %Camp{} = camp} = Games.update_camp(camp, update_attrs)
      assert camp.address == "some updated address"
      assert camp.cover_url == "some updated cover_url"
      assert camp.description == "some updated description"
      assert camp.name == "some updated name"
    end

    test "update_camp/2 with invalid data returns error changeset" do
      camp = camp_fixture()
      assert {:error, %Ecto.Changeset{}} = Games.update_camp(camp, @invalid_attrs)
      assert camp == Games.get_camp!(camp.id)
    end

    test "delete_camp/1 deletes the camp" do
      camp = camp_fixture()
      assert {:ok, %Camp{}} = Games.delete_camp(camp)
      assert_raise Ecto.NoResultsError, fn -> Games.get_camp!(camp.id) end
    end

    test "change_camp/1 returns a camp changeset" do
      camp = camp_fixture()
      assert %Ecto.Changeset{} = Games.change_camp(camp)
    end
  end
end
