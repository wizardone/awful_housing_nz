defmodule AwfulHousingNzWeb.LayoutView do
  use AwfulHousingNzWeb, :view

  def active?(conn, page) do
    case conn.request_path == page do
      true -> "active"
      false -> ""
    end
  end
end
