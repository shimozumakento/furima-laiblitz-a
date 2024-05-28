import consumer from "channels/consumer"

if(location.pathname.match(/\/products\/\d/)){


  consumer.subscriptions.create({
    channel: "CommentChannel",
    product_id: location.pathname.match(/\d+/)[0]
  }, {
    connected() {
      // Called when the subscription is ready for use on the server
    },

    disconnected() {
      // Called when the subscription has been terminated by the server
    },

    received(data) {
      console.log(data)
      const html = `
      <div class="comment">
        <div class="comment-left-side">
          <p class="user-info">${data.user.nickname}：${data.comment.comment}</p>
        </div>
      </div>`
      const comments = document.getElementById("comments")
      comments.insertAdjacentHTML('beforeend', html)
      const commentForm = document.getElementById("comment-form")
      commentForm.reset();

    }
  })
}