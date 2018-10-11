defmodule AwfulHousingNz.Picture do
  use Ecto.Schema
  import Ecto.Changeset

  schema "pictures" do
    field :picture, :any, virtual: true
    field :name, :string
    belongs_to :property, Property
    timestamps()
  end

  def changeset(picture, params \\ %{}) do
    picture
    |> cast(params, [:picture])
    |> transform_picture
  end

  defp transform_picture(changeset) do
    case changeset do
      %Ecto.Changeset{valid?: valid, changes: %{picture: picture}} ->
        changeset
        |> put_change(:name, picture.filename)
        |> put_change(:type, picture.content_type)
        _-> changeset
    end
  end
end
