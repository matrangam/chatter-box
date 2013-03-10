define "lib/Service/ChatService",
[
  "backbone"
], (Backbone) ->
  class ChatService extends Backbone.Model

    ## Public Instance Methods

    SendMessage: (message) =>
      @trigger @constructor.EVENT.ON_RECEIVE, message

    ## Class Constants

    @EVENT ?= {}
    @EVENT.ON_RECEIVE = "on-receive"
