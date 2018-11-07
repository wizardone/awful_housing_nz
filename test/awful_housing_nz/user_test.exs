defmodule AwfulHousingNz.UserTest do
  use AwfulHousingNz.DataCase

  alias AwfulHousingNz.User

  @valid_attrs %{email: "pat@example.com", first_name: "Pat Example", last_name: "Some"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = User.changeset(%User{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = User.changeset(%User{}, @invalid_attrs)
    refute changeset.valid?
  end
end
