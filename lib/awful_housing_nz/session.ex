defmodule AwfulHousingNz.Session do
  import Ecto.Changeset
  @attributes [:email, :password]

  defstruct @attributes

  @doc false
  def changeset(attrs) do
    {%AwfulHousingNz.Session{}, %{email: :string, password: :string}}
    |> Ecto.Changeset.cast(attrs, @attributes)
    |> Ecto.Changeset.validate_required(@attributes)
    |> validate_password
  end

  def authenticate(%AwfulHousingNz.Session{email: email, password: password}) do
    
  end

  defp validate_password(changeset) do
    case changeset.changes do
      %{email: email, password: password} ->
        user = AwfulHousingNz.Repo.get_by(AwfulHousingNz.User, email: email)
        case user do
          %AwfulHousingNz.User{encrypted_password: encrypted_password} -> AwfulHousingNz.User.password_correct?(user, password)
          nil -> add_error(changeset, :email, "No user with this email")
        end
      %{} -> changeset
    end
  end
end
