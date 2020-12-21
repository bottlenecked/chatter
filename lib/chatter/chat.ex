defmodule Chatter.Chat do
  alias Chatter.{Chat, Repo}

  def all_rooms do
    Chat.Room
    |> Repo.all()
  end

  def new_chat_room do
    raise "begin inner testing circle"
  end
end
