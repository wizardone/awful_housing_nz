defmodule AwfulHousingNzWeb.SessionControllerTest do
  use AwfulHousingNzWeb.ConnCase

  describe "GET /new" do
    test "displayes the login form", %{conn: conn} do
      conn = get conn, "/sessions/new"
      assert html_response(conn, 200) =~ "Login"
    end
  end

  describe "POST /create" do
    test "returns an error if the user or password do not match", %{conn: conn} do
      conn = post conn, "/sessions", [session: %{email: "some_email", password: "some_password"}]

      assert get_flash(conn, :error) == "email or password incorrect"
    end
  end
end
