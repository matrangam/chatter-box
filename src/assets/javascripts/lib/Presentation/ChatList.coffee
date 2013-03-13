define "lib/Presentation/ChatList",
[
  "backbone"
  "lib/Presentation/ChatListItem"
], (Backbone, ChatListItem) ->
  class ChatList extends Backbone.View

    className: "chat-list"

    render: =>
      @$el.append(@_getChatList())
      @

    _getChatList: => @_chatList ?= $('<ul class="chats">')

    AppendNewListItem: (message) => @$(".chats").append(new ChatListItem(message: message).render().el)

