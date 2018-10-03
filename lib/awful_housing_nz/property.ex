defmodule AwfulHousingNz.Property do
  use Ecto.Schema
  import Ecto.Changeset

  schema "properties" do
    field :city, :string
    field :suburb, :string
    field :street, :string
    has_many :pictures, Picture
  end
end
