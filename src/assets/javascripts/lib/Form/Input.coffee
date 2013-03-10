define "lib/Form/Input", ["backbone"], (Backbone) ->
  Form = {}

  class Form.Input extends Backbone.View
    ## View Configuration

    tagName: "input"
    className: "input"

    ## Protected Instance Properties

    _lastSetValue: null

    ## Initialize

    initialize: (options) ->
      super

      @_setIdAttribute @cid
      @SetValue @options.value

    ## Public Instance Methods

    Disable: =>
      @_disable()
      @

    Enable: =>
      @_enable()
      @

    GetComplexValue: => @_getComplexValue()

    GetValue: => @_getValue()

    SetValue: (newValue) =>
      @_lastSetValue = newValue
      @_setValue @_lastSetValue
      @_triggerChange()
      @

    ## Protected Instance Methods

    _getComplexValue: => @GetValue()

    _reSetValue: => @SetValue @_lastSetValue

    _triggerChange: => @trigger @constructor.EVENT.CHANGE, @, @GetValue(), @GetComplexValue()

    ## Abstract Protected Instance Methods

    _disable: => throw "_disable() must be implemented"

    _enable: => throw "_enable() must be implemented"

    _getValue: => throw "_getValue() must be implemented"

    _setIdAttribute: (id) => throw "_setIdAttribute must be implemented"

    _setValue: (newValue) => throw "_setValue() must be implemented"

    ## Class Constants

    @EVENT =
      CHANGE: "change"
