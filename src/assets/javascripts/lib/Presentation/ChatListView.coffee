define "lib/Presentation/ChatListView",
[
  "backbone"
  "lib/Presentation/ChatListItem"
], (Backbone, ChatListItem) ->
  class ChatListView extends Backbone.View

    ## Template

    template: _.template(
      '<div>'+
        '<ul class="chatList"></ul>'+
      '</div>'
    )

    render: =>
      @$el.html @template()
      @

    AppendNewListItem: (message) => @$(".chatList").append(new ChatListItem(message: message).render().el)

