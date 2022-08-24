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

  // chatContent.addEventListener('input', function(){
  //   changeLineCheck();
  // })

  // const maxLineCount = 10;

  // const getLineCount = function(){
  //     return (chatContent.value + '\n').match(/\r?\n/g).length;
  // }

  // let lineCount = getLineCount();
  // let newLineCount;

  // const changeLineCheck = function(){
  //   newLineCount = Math.min(getLineCount(), maxLineCount);
  //   if (lineCount !== newLineCount) {
  //     changeLineCount(newLineCount);
  //   }
  // };

  // const footer = document.getElementsByClassName('chat-box');
  // let footerHeight = footer.scrollHeight;
  // let newFooterHeight, footerHeightDiff;

  // const changeLineCount = function(newLineCount){
  //   chatContent.rows = lineCount = newLineCount;
  //   newFooterHeight = footer.scrollHeight;
  //   footerHeightDiff = newFooterHeight - footerHeight;
  //   if (footerHeightDiff > 0) {
  //     chatContainer.style.paddingBottom = newFooterHeight + 'px';
  //     window.scrollBy(0, footerHeightDiff);
  //   } else {
  //     window.scrollBy(0, footerHeightDiff);
  //     chatContainer.style.paddingBottom = newFooterHeight + 'px';
  //   }
  //   footerHeight = newFooterHeight;
  // };
});