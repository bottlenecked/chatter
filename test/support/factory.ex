defmodule Chatter.Factory do
  use ExMachina.Ecto, repo: Chatter.Repo

  # convention: ex_machina looks for <:name>_factory methods to delegate insert/1 and build/1 callbacks to
  def chat_room_factory do
    %Chatter.Chat.Room{
      name: sequence(:name, &"chatroom #{&1}")
    }
  end

  def user_factory do
    %Chatter.User{
      email: sequence(:email, &"super#{&1}@example.com"),
      password: "password1"
    }
  end

  def set_password(user, password) do
    user
    |> Ecto.Changeset.change(%{password: password})
    |> Doorman.Auth.Bcrypt.hash_password()
    |> Doorman.Auth.Secret.put_session_secret()
    |> Ecto.Changeset.apply_changes()
  end
end
