defmodule ForestCampServer.Games do
  @moduledoc """
  The Games context.
  """

  import Ecto.Query, warn: false
  alias ForestCampServer.Repo

  alias ForestCampServer.Games.Match

  @doc """
  Returns the list of matches.

  ## Examples

      iex> list_matches()
      [%Match{}, ...]

  """
  def list_matches do
    Repo.all(Match)
    |> Repo.preload(:camp)
  end

  @doc """
  Gets a single match.

  Raises `Ecto.NoResultsError` if the Match does not exist.

  ## Examples

      iex> get_match!(123)
      %Match{}

      iex> get_match!(456)
      ** (Ecto.NoResultsError)

  """
  def get_match!(id) do
    Repo.get!(Match, id)
    |> Repo.preload(:camp)
  end

  @doc """
  Creates a match.

  ## Examples

      iex> create_match(%{field: value})
      {:ok, %Match{}}

      iex> create_match(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_match(camp, attrs \\ %{}) do
    %Match{}
    |> Match.changeset(attrs)
    |> Ecto.Changeset.put_assoc(:camp, camp)
    |> Repo.insert()
  end

  @doc """
  Updates a match.

  ## Examples

      iex> update_match(match, %{field: new_value})
      {:ok, %Match{}}

      iex> update_match(match, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_match(%Match{} = match, attrs) do
    match
    |> Match.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a match.

  ## Examples

      iex> delete_match(match)
      {:ok, %Match{}}

      iex> delete_match(match)
      {:error, %Ecto.Changeset{}}

  """
  def delete_match(%Match{} = match) do
    Repo.delete(match)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking match changes.

  ## Examples

      iex> change_match(match)
      %Ecto.Changeset{data: %Match{}}

  """
  def change_match(%Match{} = match, attrs \\ %{}) do
    Match.changeset(match, attrs)
  end

  alias ForestCampServer.Games.Camp

  @doc """
  Returns the list of camps.

  ## Examples

      iex> list_camps()
      [%Camp{}, ...]

  """
  def list_camps do
    Repo.all(Camp)
  end

  @doc """
  Gets a single camp.

  Raises `Ecto.NoResultsError` if the Camp does not exist.

  ## Examples

      iex> get_camp!(123)
      %Camp{}

      iex> get_camp!(456)
      ** (Ecto.NoResultsError)

  """
  def get_camp!(id), do: Repo.get!(Camp, id)

  @doc """
  Creates a camp.

  ## Examples

      iex> create_camp(%{field: value})
      {:ok, %Camp{}}

      iex> create_camp(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_camp(attrs \\ %{}) do
    %Camp{}
    |> Camp.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a camp.

  ## Examples

      iex> update_camp(camp, %{field: new_value})
      {:ok, %Camp{}}

      iex> update_camp(camp, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_camp(%Camp{} = camp, attrs) do
    camp
    |> Camp.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a camp.

  ## Examples

      iex> delete_camp(camp)
      {:ok, %Camp{}}

      iex> delete_camp(camp)
      {:error, %Ecto.Changeset{}}

  """
  def delete_camp(%Camp{} = camp) do
    Repo.delete(camp)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking camp changes.

  ## Examples

      iex> change_camp(camp)
      %Ecto.Changeset{data: %Camp{}}

  """
  def change_camp(%Camp{} = camp, attrs \\ %{}) do
    Camp.changeset(camp, attrs)
  end
end
