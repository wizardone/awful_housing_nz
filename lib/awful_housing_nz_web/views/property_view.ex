defmodule AwfulHousingNzWeb.PropertyView do
  use AwfulHousingNzWeb, :view
  use Phoenix.Endpoint, otp_app: :awfulhousing_nz

  def property_images(picture) do
    img_tag(static_path(picture.name))
  end
end

