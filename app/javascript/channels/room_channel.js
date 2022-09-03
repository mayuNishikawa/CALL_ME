import consumer from "./consumer"

document.addEventListener('turbolinks:load', () => {
  window.chatContainer = document.getElementById('chats')

  const element = document.getElementById('room-id');
  const room_id = element.getAttribute('data-room-id');

  let already_connected = false
  for (let subscription of consumer.subscriptions.subscriptions) {
    let already_connected_room_id = JSON.parse(subscription.identifier).room_id
    if (already_connected_room_id === room_id) {
      already_connected = true
      break
    }
  }
  
  if (chatContainer == null || already_connected) {
    return
  }
  
  consumer.subscriptions.create({ channel: "RoomChannel", room_id: room_id}, {
    connected() {
    },

    disconnected() {
    },

    received(data) {
      chatContainer.innerHTML = chatContainer.innerHTML + data.html
    }
  });

  const documentElement = document.documentElement
  window.chatContent = document.getElementById('chat_content')
  window.scrollToBottom = function(){
    window.scroll(0, documentElement.scrollHeight);
  }
  scrollToBottom();
});
