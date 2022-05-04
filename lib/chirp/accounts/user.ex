defmodule Chirp.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :bio, :string
    field :full_name, :string
    field :profile_pic, {:array, :string}, default: []
    field :username, :string
    field :photos, {:array, :string}, default: []

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:username, :full_name, :bio, :profile_pic])
    |> validate_required([:username, :full_name, :bio, :profile_pic])
  end
end
