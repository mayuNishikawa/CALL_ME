import consumer from "./consumer"

document.addEventListener('turbolinks:load', () => {

    window.chatContainer = document.getElementById('chat-container');

    if (chatContainer === null) {
        return;
    };

    consumer.subscriptions.create("RoomChannel", {
        connected() {
            console.log("connected to room channel...");
        },

        disconnected() {
        },

        received(data) {
            chatContainer.insertAdjacentHTML('beforeend', data['chat']);
        }
    });

    const documentElement = document.documentElement
    window.messageContent = document.getElementById('chat_content')
    window.scrollToBottom = function(){
        window.scroll(0, documentElement.scrollHeight);
    }

    scrollToBottom();
});