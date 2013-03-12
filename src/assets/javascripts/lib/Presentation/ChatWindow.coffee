define "lib/Presentation/ChatWindow",
[
  "backbone"
  "lib/Presentation/ChatInput"
]
(Backbone, ChatInput) ->
  class ChatWindow extends Backbone.View
    ## Configuration

    className: "chat-window"

    ## Initialize

    initialize: (options) =>
      null

    ## Templates

    template: _.template(
      '<div>'+
        '<div class="content"></div>'+
      '</div>'
    )

    ## Render

    render: =>

      @
