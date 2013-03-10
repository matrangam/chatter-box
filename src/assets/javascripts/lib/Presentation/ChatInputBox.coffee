define "lib/Presentation/ChatInputBox",
[
  "backbone"
  "lib/Form/Field"
  "lib/Form/TextInput"
  "lib/Service/ChatService"
],
(Backbone, Field, TextInput, ChatService) ->
  class extends Backbone.View

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

    ## Templates

    template: _.template(
      '<article class="context">'+
        '<form novalidate>'+
          '<div class="content">'+
            '<div class="fields">'+
            '</div>'+
          '</div>'+
          '<footer>'+
            '<div class="primary-actions">'+
              '<ul><li><button type="submit" class="button continue">Chat</button></li></ul>'+
            '</div>'+
          '</footer>'+
        '</form>'+
      '</article>'
    )


    render: =>
      @$el.append(@_yieldWrapper)

      @$el.html @template()
      @$("div.fields").append(@_chatInputField.render().el)

      @

    ## Private Instance MEthods

    _getChatService: =>
      unless @_chatService?
        @_chatService = new ChatService()
        console.log @_chatService
        @_chatService.on ChatService.EVENT.ON_RECEIVE, @_chatServiceOnReceive
      @_chatService

    ## Event Handlers

    _chatServiceOnReceive: => console.log "SONSOSNOSNSONS: ", arguments

    _handleFormSubmit: (e) =>
      e.preventDefault()

      @_getChatService().SendMessage @_chatInputField.GetValue()

      false
