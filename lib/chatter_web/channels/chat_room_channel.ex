defmodule ChatterWeb.ChatRoomChannel do
  use ChatterWeb, :channel

  alias Chatter.Chat

  def join("chat_room:" <> _room_name, _msg, socket) do
    {:ok, socket}
  end

  def handle_in("new_message", payload, socket) do
    %{room: room, author: author} = socket.assigns
    final_payload = Map.put(payload, "author", author)
    Chat.new_message(room, final_payload)
    broadcast(socket, "new_message", final_payload)
    {:noreply, socket}
  end
end
