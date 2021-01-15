import socket from "./socket"

let chatRoomTitle = document.getElementById("chat-room-title");
if (chatRoomTitle) {
    let chatRoomName = chatRoomTitle.dataset.chatRoomName;
    let channel = socket.channel(`chat_room:${chatRoomName}`, {})

    let messageForm = document.getElementById("new-message-form");
    let messageInput = document.getElementById("message");
    let messageContainer = document.querySelector("[data-role='messages']");
    messageForm.addEventListener("submit", e => {
        e.preventDefault();
        channel.push("new_message", {
            body: messageInput.value
        });
        e.target.reset();
    });

    channel.on("new_message", payload => {
        let messageItem = document.createElement("li");
        messageItem.dataset.role = "message";
        messageItem.innerText = `${payload.author}: ${payload.body}`;
        messageContainer.appendChild(messageItem);
    });

    channel.join();
}