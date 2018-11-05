defmodule AwfulHousingNzWeb.UserControllerTest do
  use AwfulHousingNzWeb.ConnCase

  describe "GET /users" do
    test "without any users", %{conn: conn} do
      conn = get conn, "/users"
      assert html_response(conn, 200) =~ "A list of users!"
    end

    test "with users on the page", %{conn: conn} do
      # TODO Insert users and check response
       conn = get conn, "/users"
       assert html_response(conn, 200) =~ "A list of users!"
    end
  end
end

