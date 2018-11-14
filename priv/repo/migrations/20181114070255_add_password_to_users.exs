defmodule AwfulHousingNz.Repo.Migrations.AddPasswordToUsers do
  use Ecto.Migration

  def change do
    alter table("users") do
      add :encrypted_password, :string, null: false
    end
  end
end
