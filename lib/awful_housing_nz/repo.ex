defmodule AwfulHousingNz.Repo do
  use Ecto.Repo, otp_app: :awful_housing_nz

  @doc """
  Dynamically loads the repository url from the
  DATABASE_URL environment variable.
  """
  def init(_, opts) do
    #{:ok, Keyword.put(opts, :url, System.get_env("DATABASE_URL"))}
    {:ok, opts}
  end
end
