defmodule AwfulHousingNzWeb.UserController do
  use AwfulHousingNzWeb, :controller

  def index(conn, _params) do
    users = AwfulHousingNz.Repo.all(User)
    conn
    |> render("index.html", users: users)
  end

  def new(conn, _params) do
    changeset = User.changeset(%User{}, %{})
    conn
    |> render("new.html", changeset: changeset)
  end

  def create(conn, %{"user" => user_params}) do
    changeset = User.changeset(%User{}, user_params)
    case AwfulHousingNz.Repo.insert(changeset) do
      {:ok, _some_info} ->
        conn |> redirect(to: user_path(conn, :index))
      {:error, changeset} ->
        conn
        |> put_flash(:error, "Please check your form for errors")
        |> render("new.html", changeset: changeset)
    end
  end
end
