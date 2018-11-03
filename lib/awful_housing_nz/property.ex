defmodule AwfulHousingNz.Property do
  use Ecto.Schema
  import Ecto.Changeset

  schema "properties" do
    field :city, :string
    field :suburb, :string
    field :street, :string
    has_many :pictures, AwfulHousingNz.Picture, on_delete: :delete_all
    timestamps()
  end

  def changeset(property, params \\ %{}) do
    property
    |> AwfulHousingNz.Repo.preload(:pictures)
    |> cast(params, [:city, :street, :suburb])
    |> validate_required([:city, :suburb, :street])
    |> cast_assoc(:pictures, required: true)
  end
end
