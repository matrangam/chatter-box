define "lib/Presentation/ChatWindow",
[
  "backbone"
  "lib/Presentation/ChatInput"
  "lib/Presentation/ChatList"
  "lib/Service/ChatService"
],
(Backbone, ChatInput, ChatList, ChatService) ->
  class ChatWindow extends Backbone.View
    ## Configuration

    className: "chat-window"

    initialize: (options) ->


    ## Render

    render: =>
      @$el.append(@_getChatList().render().el)
      @$el.append(@_getChatInput().render().el)
      @

    ## Protected Instance Methods

    _getChatInput: =>
      unless @_chatInput?
        @_chatInput = new ChatInput()
        @_chatInput.on ChatInput.EVENT.MESSAGE_SEND, @_chatInputEventMessageSend
      @_chatInput

    _getChatList: => @_chatList ?= new ChatList()

    _getChatService: => @_chatService ?= new ChatService()

    ## Event Handlers

    _chatInputEventMessageSend: (message, input) => @_getChatList().AppendNewListItem(message)
