App.chat = App.cable.subscriptions.create "ChatChannel",
  received: (data) ->
    if data.action == "remove"
      $("#chat_#{data.message}").remove()
    else
      $(".messages").prepend(data.message)
