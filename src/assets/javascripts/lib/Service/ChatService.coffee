define "lib/Service/ChatService",
[
  "backbone"
  "pusher"
], (Backbone, Pusher) ->
  class ChatService extends Backbone.Model

    ## Initialize

    intitialize: =>
      pusher = new Pusher("947fc1f864a8c578343c")

    ## Public Instance Methods

    SendMessage: (message) =>
      @trigger @constructor.EVENT.ON_RECEIVE, message

    ## Class Constants

    @EVENT ?= {}
    @EVENT.ON_RECEIVE = "on-receive"
