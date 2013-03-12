define "lib/Presentation/ChatInput",
[
  "backbone"
  "lib/Form/Field"
  "lib/Form/TextInput"
  "lib/Service/ChatService"
  "lib/Presentation/ChatListView"
],
(Backbone, Field, TextInput, ChatService, ChatListView) ->
  class ChatInput extends Backbone.View

    ## Configuration

    className: "canvas pie-clearfix"

    ## Events

    events: "submit form": "_handleFormSubmit"

    ## Initialize

    initialize: (options) ->
      @_yieldWrapper = $("<div>").addClass("yield")

      @_chatInputField = new Field
        input: new TextInput()
        label: "Chat here -->"

      @_chatListView = new ChatListView()

    ## Templates

    template: _.template(
      '<form novalidate>'+
        '<div class="content"></div>'+
        '<footer>'+
          '<div class="primary-actions">'+
            '<ul><li><button type="submit" class="button continue">Chat</button></li></ul>'+
          '</div>'+
        '</footer>'+
      '</form>'
    )

    render: =>
      @$el.append(@_yieldWrapper)

      @$el.html @template()
      @$("div.content").append(@_chatInputField.render().el)
      @$el.append(@_chatListView.render().el)

      @

    ## Private Instance Methods

    _getChatService: =>
      unless @_chatService?
        @_chatService = new ChatService()
        @_chatService.on ChatService.EVENT.ON_RECEIVE, @_chatServiceOnReceive
      @_chatService

    ## Event Handlers

    _chatServiceOnReceive: (message) =>
      @_chatListView.AppendNewListItem(message)

    _handleFormSubmit: (e) =>
      e.preventDefault()

      @_getChatService().SendMessage @_chatInputField.GetValue()
      @_chatInputField.SetValue null

      false
