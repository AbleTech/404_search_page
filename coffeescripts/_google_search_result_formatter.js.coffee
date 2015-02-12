window.NotFound ||= {}

class NotFound.GoogleSearchResultFormatter
  constructor: ({@results}) ->

  bind: =>
    if @results.items?
      @writeResults()
    else
      @handleError()

  insertHTML: (html) =>
    document.getElementById('googleResults').innerHTML = html

  writeResults: =>
    html = ""

    for result in @results.items
      html += '<div class="result">'
      html +=   "<a class=\"title\" href=\"#{result.link}\">#{result.htmlTitle}</a><br>"
      html +=   "<p class=\"description\">#{result.htmlSnippet}</p>"
      html += '</div>'

    @insertHTML(html)

  handleError: =>
    html = "<div class=\"result\"><p class=\"description\" style=\"display: block;\">No suggestions found.</p></div>";

    @insertHTML(html)
