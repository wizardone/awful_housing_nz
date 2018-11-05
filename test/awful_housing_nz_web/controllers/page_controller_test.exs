defmodule AwfulHousingNzWeb.PageControllerTest do
  use AwfulHousingNzWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get conn, "/"
    assert html_response(conn, 200) =~ "Awful Housing welcomes you"
  end
end
