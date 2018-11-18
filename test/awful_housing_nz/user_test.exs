defmodule AwfulHousingNz.UserTest do
  use AwfulHousingNz.DataCase

  alias AwfulHousingNz.User

  @valid_attrs %{
    email: "pat@example.com",
    first_name: "Pat Example",
    last_name: "Some",
    password: "qwe",
    password_confirmation: "qwe"
  }
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = User.changeset(%User{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = User.changeset(%User{}, @invalid_attrs)
    refute changeset.valid?
  end

  describe "password_correct?" do
    test "password is correct" do
      user = insert(:user, %{encrypted_password: Comeonin.Bcrypt.hashpwsalt("qweqwe")})
      assert User.password_correct?(user, "qweqwe") == {:ok, true}
    end

    test "password is not correct" do
      user = insert(:user, %{encrypted_password: Comeonin.Bcrypt.hashpwsalt("qweqwe")})
      assert User.password_correct?(user, "random test") == {:error, false}
    end
  end
end
