defmodule AwfulHousingNz.Property do
  use Ecto.Schema
  import Ecto.Changeset

  schema "properties" do
    field :city, :string
    field :suburb, :string
    field :street, :string
    has_many :pictures, AwfulHousingNz.Picture, on_delete: :delete_all
  end

  def changeset(property, params \\ %{}) do
    property
    |> cast(params, [:city, :street, :suburb])
    |> cast_assoc(:pictures, required: true)
    |> validate_required([:city, :suburb, :street])
  end
end
