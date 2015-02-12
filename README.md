# 404 Search Page

A 404 page that utilizes Google Custom search to search the site for related pages based on the URL given.

## Setting up a Google Custom Search Key

1. Create your Google public key
  1. Navigate to [Google Dev Console](https://console.developers.google.com/project)
  2. Create a Project
  3. Enable the Custom Search API
  4. Navigate to the credentials page
  5. Create a new Browser Key listing your accepted referers, enter * is your site is public.
  6. Take note of your public key
2. Create a Search Engine Id
  1. Navigate to [Google Custom Search Engine](https://www.google.co.nz/cse/all)
  2. Add a new Search Engine
  3. Enter the site/s you would like to run searches on
  4. Navigate to the Custom Search you have added
  5. Under details select Search Engine ID and take note of the ID presented


## Setting up the script
In order for the script to run you will need to enter your Google API keys and define a site to search.

### In Javascript
#### 404.js
```javascript
1: var googleSearchKey = "[Enter your Google Public Key Here]";
2: var googleSearchEngineID = "[Enter your Search Engine ID Here]";
3: var searchPhrase = "";
4: var siteToSearch = "[Enter the site to run a search on Here]";
```

### In CoffeScript
#### _google_search_handler.js.coffee
```coffeescript
4: constructor: ({@currentPath}) ->
5:   @googleSearchKey = '[Enter your Google Public Key Here]'
6:   @googleSearchEngineID = '[Enter your Search Engine ID Here]'
...
18:  googleQueryURL: =>
19:    siteToSearch = '[Enter the site to run a search on Here]'
```

## Adding to your site
Follow these steps to add the Search functionality to your page:

- Create a 404 page for your site (How this is done will vary depending on how you host your site)
- Add the following code to your 404 page:

```html
  <div id="googleResults">
    <div class="result" style="background: none; text-align: center;">
      <!--[if !IE]>-->
      <div class="spinner">
        <div class="dot1"></div>
        <div class="dot2"></div>
      </div>
      <!--<![endif]-->
      <!--[if lte IE 9]>
      <div class="spinner gifspinner"></div>
      <![endif]-->
      <p class="description">
        Hunting for similar pages...
      </p>
    </div>
  </div>
```

- Include a script tag inside your body but prior to the googleResults div
- Point the script tags src to either 404.js or your file containing the coffescript
- Add 404.css to your 404 page
- For IE support add ajax-loader.gif to your images folder or edit .gifspinner in 404.css
