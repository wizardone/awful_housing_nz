defmodule AwfulHousingNz.Session do
  import Ecto.Changeset
  @attributes [:email, :password]

  defstruct @attributes

  @doc false
  def changeset(attrs) do
    {%AwfulHousingNz.Session{}, %{email: :string, password: :string}}
      |> Ecto.Changeset.cast(attrs, @attributes)
      |> Ecto.Changeset.validate_required(@attributes)
  end
end
