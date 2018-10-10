defmodule AwfulHousingNzWeb.PropertyController do
  use AwfulHousingNzWeb, :controller
  def index(conn, _params) do
    conn |> render("index.html")
  end

  def new(conn, params) do
    #IO.inspect(params)
    changeset = Property.changeset(
      %Property{pictures: [%Picture{}]}, %{}
    )
    #IO.inspect(changeset)
    conn |> render("new.html", changeset: changeset)
  end

  def create(conn, %{"property" => property_params}) do
    changeset = Property.changeset(%Property{}, property_params)
    IO.inspect(changeset)

    case AwfulHousingNz.Repo.insert(changeset) do
      {:ok, _struct} ->
        conn |> redirect(to: property_path(conn, :index))
      {:error, changeset} ->
        conn
        |> put_flash(:error, "Please check your form for errors")
        |> render("new.html", changeset: changeset)
    end
  end
end
