defmodule AwfulHousingNzWeb.UserControllerTest do
  use AwfulHousingNzWeb.ConnCase

  describe "GET /users" do
    test "without any users", %{conn: conn} do
      conn = get conn, "/users"
      assert html_response(conn, 200) =~ "A list of users!"
    end

    test "with users on the page", %{conn: conn} do
      insert(:user, %{first_name: "John", email: "john@example.com", last_name: "Tester"})

      conn = get conn, "/users"
      assert html_response(conn, 200) =~ "A list of users!"
      assert html_response(conn, 200) =~ "john@example.com"
    end
  end
end

