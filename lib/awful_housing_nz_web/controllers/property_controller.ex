defmodule AwfulHousingNzWeb.PropertyController do
  use AwfulHousingNzWeb, :controller
  def index(conn, _params) do
    conn |> render("index.html")
  end

  def new(conn, _params) do
    conn |> render("new.html")
  end

  def create(conn) do

  end
end
