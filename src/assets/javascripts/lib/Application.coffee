define "lib/Application",
  [
    "jquery"
    "backbone"
    "lib/Presentation/ChatWindow"
    "jquery-path"
  ],
  (
    $
    Backbone
    ChatWindow
  ) ->
    class Application
      ## Protected Instance Properties

      _panel: null

      ## Constructor

      constructor: (config) ->
        @$ = $

        @_rootContainer = @$(config.RootContainer)

        @_canvas = new ChatWindow(
          application: @
        ).render()

        @_canvas.$el
          .hide()
          .appendTo(@_rootContainer)
          .stop()
            .fadeIn()

