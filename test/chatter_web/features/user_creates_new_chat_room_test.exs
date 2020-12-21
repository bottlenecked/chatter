defmodule ChatterWeb.Test.Features.UserCreatesNewChatRoomTest do
  use ChatterWeb.FeatureCase, async: true

  test "user creates a new chatroom successfully", %{session: session} do
    session
    |> visit(Routes.chat_room_path(@endpoint, :index))
    |> click(Query.link("New chat room"))
    |> fill_in(Query.text_field("Name"), with: "elixir")
    |> click(Query.button("Submit"))
    |> assert_has(Query.data("role", "room-title", text: "elixir"))
  end
end
