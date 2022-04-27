defmodule Chirp.Repo.Migrations.Removeandreplaceprofpic do
  use Ecto.Migration

  def change do
    alter table(:users) do
      remove :profile_pic, :string
      add :profile_pic, {:array, :string}, null: false, default: []
    end

  end
end
