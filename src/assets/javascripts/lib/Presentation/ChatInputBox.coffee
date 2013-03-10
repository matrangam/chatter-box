define "lib/Presentation/ChatInputBox",
[
  "backbone"
  "lib/Form/Field"
  "lib/Form/TextInput"
],
(Backbone, Field, TextInput) ->
  class extends Backbone.View

    className: "canvas pie-clearfix"

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

    ## Events

    events: "submit form": "_handleFormSubmit"

    ## Event Handlers

    _handleFormSubmit: (e) =>
      e.preventDefault()

      false
