defmodule AwfulHousingNzWeb.SessionController do
  use AwfulHousingNzWeb, :controller

  def new(conn, _params) do
    changeset = Session.changeset(%{})
    conn |> render("new.html", changeset: changeset)
  end

  def create(conn, %{"session" => session_params}) do
    changeset = Session.changeset(session_params)
    case changeset.valid? do
      # TODO: Maybe puth Session.authenticate here?
      true -> conn |> put_flash(:info, "Logged in successfully") |> redirect(to: page_path(conn, :index))
      false -> conn |> render("new.html", changeset: changeset)
    end
  end
end
