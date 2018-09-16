defmodule AwfulHousingNzWeb.PageController do
  use AwfulHousingNzWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
