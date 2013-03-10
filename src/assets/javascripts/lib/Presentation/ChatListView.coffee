define "lib/Presentation/ChatListView",
[
  "backbone"
], (Backbone) ->
  class ChatListView extends Backbone.View

    initialize: (options) =>
      @_items ?= @options.items

    template: _.template(
      '<div>'+
        '<ul class="chatList"></ul>'+
      '</div>'
    )

    render: =>
      @$el.html @template()
      @

    AppendNewListItem: (message) => @$(".chatList").append($("<li>").text(message))
