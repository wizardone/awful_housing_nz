defmodule AwfulHousingNz.Picture do
  use Ecto.Schema
  import Ecto.Changeset

  schema "pictures" do
    field :name, :string
    belongs_to :property, Property
  end

  def changeset(picture, params \\ %{}) do
    picture
    |> cast(params, [:name])
  end
end
