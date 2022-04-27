defmodule Chirp.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :username, :string
      add :full_name, :string
      add :bio, :string
      add :profile_pic, :string

      timestamps()
    end
  end
end
