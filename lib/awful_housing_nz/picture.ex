defmodule AwfulHousingNz.Picture do
  use Ecto.Schema
  import Ecto.Changeset

  schema "pictures" do
    field :filename, :string
    belongs_to :property, Property
  end

  def changeset(picture, params \\ %{}) do
    picture
    |> cast(params, [:filename])
    |> validate_required([:filename])
  end
end
