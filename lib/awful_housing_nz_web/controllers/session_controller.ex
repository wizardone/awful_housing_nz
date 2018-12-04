defmodule AwfulHousingNzWeb.SessionController do
  use AwfulHousingNzWeb, :controller

  def new(conn, _params) do
    changeset = Session.changeset(%{})
    conn |> render("new.html", changeset: changeset)
  end

  def create(conn, %{"session" => session_params}) do
    changeset = Session.changeset(session_params)
    case changeset.valid? do
      true ->
        case Session.authenticate(changeset.changes) do
          {:error, message} ->
            conn
            |> put_flash(:error, message)
            |> render("new.html", changeset: changeset)
          {:ok, user} ->
            conn
            |> put_session(:user_id, user.id)
            |> put_flash(:info, "Logged in successfully")
            |> redirect(to: page_path(conn, :index))
        end
      false -> conn |> render("new.html", changeset: changeset)
    end
  end

  def delete(conn, _params) do
    conn
    |> delete_session(:user_id)
    |> put_flash(:info, "Logged out")
    |> redirect(to: page_path(conn, :index))
  end
end
