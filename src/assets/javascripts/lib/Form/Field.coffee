define "lib/Form/Field",
[
  "jquery"
  "backbone"
],
($, Backbone) ->

  class extends Backbone.View
    ## Constructor

    initialize: (options) ->
      super options

      @_input = @options.input

      @_label = @options.label

      @$el.addClass "field"
      @$el.addClass "horizontal"

    ## Templates

    template: _.template(
      '<label class="first" for="<%= label_for %>"></label>'+
      '<div class="non-label">'+
        '<div class="inputs"></div>'+
      '</div>'
    )

    ## Render

    render: =>
      @$el.html @template
        label_for: @_input.cid

      @$(".inputs").append(@_input.render().el)
      @$el.find(".first").append(@_getTextLabelElement())

      @_getTextLabelElement().text(@_label)

      @

    ## Protected Instance Methods

    _getTextLabelElement: => @_textLabelElement ?= $("<span>").addClass("text")

    ## Public Instance Methods

    GetValue: => @_input.GetValue()
