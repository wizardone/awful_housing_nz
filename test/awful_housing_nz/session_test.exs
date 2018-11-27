defmodule AwfulHousingNz.SessionTest do
  use AwfulHousingNz.DataCase

  alias AwfulHousingNz.Session

  @valid_attrs %{
    email: "pat@example.com",
    password: "qwe",
  }
  @invalid_attrs %{email: "qwe"}

  test "changeset with valid attributes" do
    changeset = Session.changeset(@valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Session.changeset(@invalid_attrs)
    refute changeset.valid?
  end

  describe "authenticate" do
    test "authenticates an user" do

    end

    test "does not authenticate an user" do

    end
  end
end
