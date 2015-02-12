var googleSearchKey = "";
var googleSearchEngineID = "";
var searchPhrase = "";
var siteToSearch = "abletech.nz";

function createJSONScriptElement(){
  script = document.createElement('script');
  script.src = "https://www.googleapis.com/customsearch/v1?key="+googleSearchKey+"&cx="+googleSearchEngineID+"&q=%20"+searchPhrase+"&prettyPrint=false&siteSearch="+siteToSearch+"&callback=formatResults";
  script.type = 'text/javascript';
  script.async = false;
  return script;
}

function clean(path){
  return path.substring(1).replace(/[\W_]+/g,'%20OR%20');
}

function insertHTML(html){
  document.getElementById('googleResults').innerHTML = html;
}

function formatResults(results){
  if(results.items != null && results.items.length > 0){
    var html = "";
    for(result in results.items){
      html += '<div class="result">';
      html +=   "<a class=\"title\" href=\"#{result.link}\">#{result.htmlTitle}</a><br>";
      html +=   "<p class=\"description\">#{result.htmlSnippet}</p>";
      html += '</div>';
    }
    insertHTML(html);
  }else{
    insertHTML("<div class=\"result\"><p class=\"description\" style=\"display: block;\">No suggestions found.</p></div>");
  }
}

window.onload = function(){
  searchPhrase = clean(window.location.pathname);
  document.getElementsByTagName('body')[0].appendChild(createJSONScriptElement());
}
