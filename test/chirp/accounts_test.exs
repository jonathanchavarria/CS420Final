defmodule Chirp.AccountsTest do
  use Chirp.DataCase

  alias Chirp.Accounts

  describe "users" do
    alias Chirp.Accounts.User

    import Chirp.AccountsFixtures

    @invalid_attrs %{bio: nil, full_name: nil, profile_pic: nil, username: nil}

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Accounts.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Accounts.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      valid_attrs = %{bio: "some bio", full_name: "some full_name", profile_pic: "some profile_pic", username: "some username"}

      assert {:ok, %User{} = user} = Accounts.create_user(valid_attrs)
      assert user.bio == "some bio"
      assert user.full_name == "some full_name"
      assert user.profile_pic == "some profile_pic"
      assert user.username == "some username"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      update_attrs = %{bio: "some updated bio", full_name: "some updated full_name", profile_pic: "some updated profile_pic", username: "some updated username"}

      assert {:ok, %User{} = user} = Accounts.update_user(user, update_attrs)
      assert user.bio == "some updated bio"
      assert user.full_name == "some updated full_name"
      assert user.profile_pic == "some updated profile_pic"
      assert user.username == "some updated username"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_user(user, @invalid_attrs)
      assert user == Accounts.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Accounts.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Accounts.change_user(user)
    end
  end
end
