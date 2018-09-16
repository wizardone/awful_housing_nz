defmodule AwfulHousingNz.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :email, :string
      add :first_name, :string
      add :last_name, :string
      timestamps()
    end

    unique_index(:users, :email, unique: true)

  end
end
