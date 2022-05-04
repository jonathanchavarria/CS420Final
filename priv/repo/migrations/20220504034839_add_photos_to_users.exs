defmodule Chirp.Repo.Migrations.AddPhotosToUsers do
  use Ecto.Migration

  def change do
    alter table(:users) do
      add :photos, {:array, :string}, null: false, default: []
    end

  end
end
