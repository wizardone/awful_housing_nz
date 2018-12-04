defmodule AwfulHousingNzWeb.LayoutView do
  use AwfulHousingNzWeb, :view

  def active?(conn, page) do
    case conn.request_path == page do
      true -> "active"
      false -> ""
    end
  end

  def user_logged?(conn) do
    get_session(conn, :user_id)
  end

  def current_user(conn) do
    AwfulHousingNz.Repo.get!(AwfulHousingNz.User, get_session(conn, :user_id))
  end
end
