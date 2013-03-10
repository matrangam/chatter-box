define "lib/Application",
  [
    "jquery"
    "backbone"
    "lib/Presentation/ChatInputBox"
    "jquery-path"
  ],
  (
    $
    Backbone
    ChatInputBox
  ) ->
    class Application
      ## Protected Instance Properties

      _panel: null

      ## Constructor

      constructor: (config) ->
        @$ = $

        @_rootContainer = @$(config.RootContainer)

        @_canvas = new ChatInputBox(
          application: @
        ).render()

        @_canvas.$el
          .hide()
          .appendTo(@_rootContainer)
          .stop()
            .fadeIn()

