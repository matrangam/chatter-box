define "lib/Presentation/ChatWindow",
[
  "backbone"
  "lib/Presentation/ChatInput"
  "lib/Presentation/ChatListView"
],
(Backbone, ChatInput, ChatListView) ->
  class ChatWindow extends Backbone.View
    ## Configuration

    className: "chat-window"

    ## Initialize

    initialize: (options) =>
      @_yieldWrapper = $("<div>").addClass("yield")

    ## Templates

    template: _.template(
      '<div>'+
        '<div class="chat-list"></div>'+
        '<div class="chat-input"></div>'+
      '</div>'
    )

    ## Render

    render: =>
      @$el.append(@_yieldWrapper)
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

    _getChatList: => @_chatList ?= new ChatListView()

    ## Event Handlers

    _chatInputEventMessageSend: (message, input) => @_getChatList().AppendNewListItem(message)
