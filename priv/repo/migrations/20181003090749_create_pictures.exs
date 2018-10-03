defmodule AwfulHousingNz.Repo.Migrations.CreatePictures do
  use Ecto.Migration

  def change do
    create table(:pictures) do
      add :name, :string
      add :type, :string
      add :picture, :binary
      add :property_id, references(:properties)

      timestamps()
    end
    create index(:pictures, [:property_id])
  end
end
