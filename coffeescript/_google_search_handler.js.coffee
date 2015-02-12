window.NotFound ||= {}

class NotFound.GoogleSearchHandler
  constructor: ({@currentPath}) ->
    @googleSearchKey = ''
    @googleSearchEngineID = ''

  execute: =>
    document.getElementsByTagName('body')[0].appendChild @createJSONPScriptElement()

  createJSONPScriptElement: =>
    script = document.createElement('script')
    script.src = @googleQueryURL()
    script.type = 'text/javascript'
    script.async = false
    script

  googleQueryURL: =>
    "https://www.googleapis.com/customsearch/v1?key=#{@googleSearchKey}&cx=#{@googleSearchEngineID}&q=%20#{@cleanedSearchPhrase()}&prettyPrint=false&siteSearch=abletech.nz&callback=NotFound.googleSearchCallback"

  cleanedSearchPhrase: =>
    @currentPath.substring(1).replace(/[\W_]+/g,'%20OR%20')

NotFound.googleSearchCallback = (results) ->
  new NotFound.GoogleSearchResultFormatter(results: results).bind()
