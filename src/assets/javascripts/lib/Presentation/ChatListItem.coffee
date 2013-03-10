define "lib/Presentation/ChatListItem",
[
  "backbone"
], (Backbone) ->
  class ChatListItem extends Backbone.View
    initialize: (options) =>
      @_message = @options.message

    render: =>
      @$el.append @_getListItem()
      @

    _getListItem: => @_listItem = $('<li class="chatItem">').text(@_message)
