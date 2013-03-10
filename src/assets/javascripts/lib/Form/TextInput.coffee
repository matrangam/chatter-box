define "lib/Form/TextInput", ["lib/Form/Input"], (Input) ->

  class extends Input
    ## View Configuration

    tagName: "input"

    ## Constructor

    initialize: (options) ->
      super

      @$el
        .addClass("text")
        .attr("type", (@_inputType ? "text"))
        .attr("maxlength", @options.maxlength)
        .attr("size", @options.size)
        .attr("placeholder", @options.placeholder)
        .attr("pattern", @options.pattern)
        .on("blur", => @trigger @constructor.EVENT.BLUR, @)
        .on("keyup", => @trigger @constructor.EVENT.KEY_UP, @)

    ## Protected Instance Methods

    _disable: => @$el.attr("disabled", "disabled")

    _enable: => @$el.removeAttr("disabled")

    _getValue: => @$el.val()

    _setIdAttribute: (id) => @$el.attr("id", id)

    _setValue: (newValue) => @$el.val(newValue)

    ## Class Constants

    @EVENT ?= {}
    @EVENT.BLUR = "blur"
    @EVENT.KEY_UP = "key_up"
