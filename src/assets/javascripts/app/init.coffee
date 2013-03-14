require ["config"], (config) ->
  requirePaths =
    "delay": "lib/delay"
    "accounting": "vendor/accounting"
    "backbone": "vendor/backbone-0.9.2.min"
    "backbone-relational": "vendor/backbone-relational-0.5.0"
    "i18next": "vendor/i18next.amd.withJQuery-1.5.8"
    "jquery-path": "vendor/jquery.path"
    "moment": "vendor/moment"
    "underscore": "vendor/underscore-1.3.3.min"
    "q": "vendor/q-0.8.9"
    "pusher": "vendor/pusher.1.12.min"

  requirePaths[a] = b for a, b of config.Require?.Overrides

  require.config
    baseUrl: config.JavascriptPath
    urlArgs: "_t=#{(new Date()).getTime()}"
    paths: requirePaths
    shim:
      "backbone":
        "deps": ["jquery", "underscore"]
        "exports": "Backbone"
      "backbone-relational":
        "deps": ["backbone"]
        "exports": "Backbone"
      "delay":
        "exports": "delay"
      "underscore":
        "exports": "_"

  require(
    [
      "q"
      "jquery"
      "i18next"
      "underscore"
      "backbone"
      "lib/Application"
      "delay"
      "backbone-relational"
      "moment"
      "pusher"
    ],

    (Q, $, i18n, _, Backbone, Application) =>

      _.extend Backbone.View.prototype,
        t: $.i18n.t
        ImageUrl: (path) => "#{config.AssetPath}/images#{path}"

      _.extend Backbone.Model.prototype, t: $.i18n.t

      i18nDefer = Q.defer()
      $.i18n.init {fallbackLng: false, lng: config.I18n.Language, resGetPath: config.I18n.ResGetPath, load: "current"}, => i18nDefer.resolve()

      getRulesPromise = ""

      Q.allResolved([i18nDefer.promise, getRulesPromise]).then(() =>
        $(document).ready =>
          config.iLogRules = getRulesPromise.valueOf()
          @ChatApplication = new Application(config)
          @onerror = @ChatApplication.ErrorHandler
      ).done()
  )
