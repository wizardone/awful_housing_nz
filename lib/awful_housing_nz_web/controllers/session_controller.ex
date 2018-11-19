defmodule AwfulHousingNzWeb.SessionController do
  use AwfulHousingNzWeb, :controller

  def new(conn, _params) do
    changeset = Session.changeset(%{})
    conn |> render("new.html", changeset: changeset)
  end

  def create(conn, %{"session" => session_params}) do
    changeset = Session.changeset(session_params)
    conn |> render("new.html", changeset: changeset)
  end
end
