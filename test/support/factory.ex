defmodule AwfulHousingNzWeb.Factory do
  @moduledoc """
    Factories to use in testing
  """

  use ExMachina.Ecto, repo: AwfulHousingNz.Repo

  def user_factory do
    %AwfulHousingNz.User{
      first_name: "Test",
      last_name: "Test",
      email: "qwe@qwe.com"
    }
  end
end
