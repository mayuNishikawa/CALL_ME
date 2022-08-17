import consumer from "./consumer"

document.addEventListener('turbolinks:load', () => {
    window.chatContainer = document.getElementById('chat_container')
    if (chatContainer === null) {
        return
    }

    consumer.subscriptions.create("RoomChannel", {
        connected() {
        },

        disconnected() {
        },

        received(data) {
            chatContainer.insertAdjacentHTML('beforeend', data['chat'])
        }
    })
})