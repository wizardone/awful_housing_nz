defmodule AwfulHousingNz.Repo.Migrations.CreateProperties do
  use Ecto.Migration

  def change do
    create table(:properties) do
      add :city, :string
      add :suburb, :string
      add :street, :string
      add :description, :text
      timestamps()
    end
  end
end
