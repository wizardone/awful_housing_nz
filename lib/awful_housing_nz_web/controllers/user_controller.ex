defmodule AwfulHousingNzWeb.UserController do
  use AwfulHousingNzWeb, :controller

  def index(conn, _params) do
    conn
    |> render("index.html")
  end

  def new(conn, _params) do
    changeset = User.changeset(%User{}, %{})
    conn
    |> render("new.html", changeset: changeset)
  end

  def create(conn, %{"user" => user_params}) do
    changeset = User.changeset(%User{}, user_params)
    conn
    |> render("new.html", changeset: changeset)
  end
end
