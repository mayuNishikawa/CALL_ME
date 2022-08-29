import consumer from "./consumer"

document.addEventListener('turbolinks:load', () => {
  window.chatContainer = document.getElementById('chats')

  const element = document.getElementById('room-id');
  const room_id = element.getAttribute('data-room-id');

  if (chatContainer == null) {
    return
  }
  consumer.subscriptions.create({ channel: "RoomChannel", room_id: room_id}, {
    connected() {
    },

    disconnected() {
    },

    received(data) {
      chatContainer.innerHTML = chatContainer.innerHTML + 
      data.html
    }
  });

  const documentElement = document.documentElement
  window.chatContent = document.getElementById('chat_content')
  window.scrollToBottom = function(){
    window.scroll(0, documentElement.scrollHeight);
  }
  scrollToBottom();
});