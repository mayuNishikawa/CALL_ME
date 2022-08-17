import consumer from "./consumer"

document.addEventListener('turbolinks:load', () => {

    window.chatContainer = document.getElementById('chat-container')

    if (chatContainer === null) {
        return
    }

    consumer.subscriptions.create("RoomChannel", {
        connected() {
            console.log("connected to room channel...")
        },

        disconnected() {
        },

        received(data) {
            chatContainer.insertAdjacentHTML('beforeend', data['chat']);
            // console.log(data);
        }
    })
})