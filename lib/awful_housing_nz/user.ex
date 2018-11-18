defmodule AwfulHousingNz.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :email, :string
    field :first_name, :string
    field :last_name, :string
    field :encrypted_password, :string
    field :password, :string, virtual: true
    field :password_confirmation, :string, virtual: true
    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:email, :first_name, :last_name, :password, :password_confirmation])
    |> validate_required([:email, :first_name, :last_name, :password, :password_confirmation])
    |> validate_format(:email, ~r/@/)
    |> validate_confirmation(:password, message: "does not match password")
    |> encrypt_password()
  end

  defp encrypt_password(changeset) do
    case changeset do
      %Ecto.Changeset{valid?: true, changes: %{password: password}} ->
        put_change(changeset, :encrypted_password, Comeonin.Bcrypt.hashpwsalt(password))
      _->
        changeset
    end
  end

  def password_correct?(user, password) do
    case Comeonin.Bcrypt.checkpw(password, user.encrypted_password) do
      true -> {:ok, true}
      false -> {:error, false}
    end
  end
end
