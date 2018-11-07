defmodule AwfulHousingNz.PropertyTest do
  use AwfulHousingNz.DataCase

  alias AwfulHousingNz.Property
  alias AwfulHousingNz.Picture

  @valid_attrs %{city: "Wellington", street: "24 Lawrence", suburb: "Newtown"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Property.changeset(%Property{pictures: [%Picture{}]}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Property.changeset(%Property{}, @invalid_attrs)
    refute changeset.valid?
  end
end

