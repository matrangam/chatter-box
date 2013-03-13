define "lib/Presentation/ChatInput",
[
  "backbone"
  "lib/Form/Field"
  "lib/Form/TextInput"
],
(Backbone, Field, TextInput) ->
  class ChatInput extends Backbone.View
    ## Events

    events: "submit form": "_handleFormSubmit"

    className: "chat-input"

    ## Initialize

    initialize: (options) ->
      @_chatInputField = new Field
        input: new TextInput()
        label: "Chat here -->"

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
      @$el.html @template()
      @$("div.content").append(@_chatInputField.render().el)

      @

    _handleFormSubmit: (e) =>
      e.preventDefault()
      @trigger @constructor.EVENT.MESSAGE_SEND, @_chatInputField.GetValue(), @
      @_chatInputField.SetValue null

      false

    ## Events

    @EVENT ?= {}
    @EVENT.MESSAGE_SEND = "message-send"
