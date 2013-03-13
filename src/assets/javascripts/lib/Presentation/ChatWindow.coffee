define "lib/Presentation/ChatWindow",
[
  "backbone"
  "lib/Presentation/ChatInput"
  "lib/Presentation/ChatList"
],
(Backbone, ChatInput, ChatList) ->
  class ChatWindow extends Backbone.View
    ## Configuration

    className: "chat-window"

    ## Templates

    template: _.template(
      '<div class="chat-list"></div>'+
      '<div class="chat-input"></div>'
    )

    ## Render

    render: =>
      @$el.html @template()
      @$(".chat-list").append(@_getChatList().render().el)
      @$(".chat-input").append(@_getChatInput().render().el)
      @

    ## Protected Instance Methods

    _getChatInput: =>
      unless @_chatInput?
        @_chatInput = new ChatInput()
        @_chatInput.on ChatInput.EVENT.MESSAGE_SEND, @_chatInputEventMessageSend
      @_chatInput

    _getChatList: => @_chatList ?= new ChatList()

    ## Event Handlers

    _chatInputEventMessageSend: (message, input) => @_getChatList().AppendNewListItem(message)
