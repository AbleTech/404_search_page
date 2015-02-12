window.NotFound ||= {}

class NotFound.NotFoundPageHandler
  constructor: ->
    @currentPath = window.location.pathname

  bind: =>
    @_callGoogle()

  _callGoogle: =>
    new NotFound.GoogleSearchHandler(currentPath: @currentPath).execute()

new NotFound.NotFoundPageHandler().bind()
