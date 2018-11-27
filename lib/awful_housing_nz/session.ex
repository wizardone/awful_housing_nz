defmodule AwfulHousingNz.Session do
  import Ecto.Changeset
  @attributes [:email, :password]
  @error_message "email or password incorrect"

  defstruct @attributes

  @doc false
  def changeset(attrs) do
    {%AwfulHousingNz.Session{}, %{email: :string, password: :string}}
    |> Ecto.Changeset.cast(attrs, @attributes)
    |> Ecto.Changeset.validate_required(@attributes)
  end

  def authenticate(%{email: email, password: password}) do
    case user = AwfulHousingNz.Repo.get_by(AwfulHousingNz.User, email: email) do
      %AwfulHousingNz.User{encrypted_password: encrypted_password} ->
        case AwfulHousingNz.User.password_correct?(user, password) do
          true -> {:ok, "authenticated"}
          false -> {:error, @error_message}
        end
      nil -> {:error, @error_message}
    end
  end
end
