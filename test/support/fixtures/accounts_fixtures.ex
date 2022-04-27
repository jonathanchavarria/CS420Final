defmodule Chirp.AccountsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Chirp.Accounts` context.
  """

  @doc """
  Generate a user.
  """
  def user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> Enum.into(%{
        bio: "some bio",
        full_name: "some full_name",
        profile_pic: "some profile_pic",
        username: "some username"
      })
      |> Chirp.Accounts.create_user()

    user
  end
end
