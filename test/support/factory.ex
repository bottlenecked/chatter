defmodule Chatter.Factory do
  use ExMachina.Ecto, repo: Chatter.Repo

  # convention: ex_machina looks for <:name>_factory methods to delegate insert/1 and build/1 callbacks to
  def chat_room_factory do
    %Chatter.Chat.Room{
      name: sequence(:name, &"chatroom #{&1}")
    }
  end
end
