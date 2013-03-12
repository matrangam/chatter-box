define "lib/Application",
  [
    "jquery"
    "backbone"
    "lib/Presentation/ChatInput"
    "jquery-path"
  ],
  (
    $
    Backbone
    ChatInput
  ) ->
    class Application
      ## Protected Instance Properties

      _panel: null

      ## Constructor

      constructor: (config) ->
        @$ = $

        @_rootContainer = @$(config.RootContainer)

        @_canvas = new ChatInput(
          application: @
        ).render()

        @_canvas.$el
          .hide()
          .appendTo(@_rootContainer)
          .stop()
            .fadeIn()

