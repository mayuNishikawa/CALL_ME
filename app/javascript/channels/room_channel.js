import consumer from "./consumer"

document.addEventListener('turbolinks:load', () => {
  const element = document.getElementById('room-id');
  const room_id = element.getAttribute('data-room-id');

  consumer.subscriptions.create({ channel: "RoomChannel", room_id: room_id}, {
    connected() {
      console.log("connected to room channel" + room_id);
    },

    disconnected() {
    },

    received(data) {
      const chatContainer = document.getElementById('chats')
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

  const chatButton = document.getElementById('chat-button');
  const button_activation = function(){
    if (chatContent.value === '') {
      chatButton.classList.add('disabled');
    } else {
      chatButton.classList.remove('disabled');
    }
  }

  chatContent.addEventListener('input', function(){
      button_activation();
  })
  chatButton.addEventListener('click', function(){
      chatButton.classList.add('disabled');
  })
});