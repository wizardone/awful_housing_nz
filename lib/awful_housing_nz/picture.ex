defmodule AwfulHousingNz.Picture do
  use Ecto.Schema
  import Ecto.Changeset
  import Ecto.Query

  schema "pictures" do
    field :picture, :any, virtual: true
    field :name, :string
    field :type, :string
    belongs_to :property, Property
    timestamps()
  end

  def changeset(picture, params \\ %{}) do
    picture
    |> cast(params, [:picture])
    |> transform_picture
    |> move_picture
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

  defp move_picture(changeset) do
    case changeset do
      %Ecto.Changeset{valid?: true, changes: %{picture: picture}} ->
        property_id = last_property_id() + 1
        # TODO: check the directory creation?
        File.mkdir_p!("./priv/static/images/properties/#{property_id}")
        case File.copy(picture.path, "./priv/static/images/properties/#{property_id}/#{picture.filename}") do
          {:ok, result} -> changeset
          {:error, reason} -> IO.inspect(reason)
        end
      _-> changeset
    end
  end

  defp last_property_id do
    case AwfulHousingNz.Repo.one(from property in AwfulHousingNz.Property, order_by: [desc: property.id], limit: 1) do
      %AwfulHousingNz.Property{id: id} -> id
      nil -> 0
    end
  end
end
