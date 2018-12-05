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
      user = insert(:user)
      result = Session.authenticate(%{email: "qwe@qwe.com", password: "qweqwe"})

      assert result == {:ok, user}
    end

    test "does not authenticate an user if he does not exist" do
      result = Session.authenticate(%{email: "qwe@qwe.com", password: "qweqwe"})

      assert result == {:error, "email or password incorrect"}
    end

    test "does not authenticate an user if his password is incorrect" do
      insert(:user)
      result = Session.authenticate(%{email: "qwe@qwe.com", password: "wat_is_this"})

      assert result == {:error, "email or password incorrect"}
    end
  end
end
