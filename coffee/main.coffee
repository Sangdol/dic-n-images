$ ->
  DIC_URL_PREFIX = 'http://alldic.daum.net/search.do?dic=eng&q='
  IMAGES_URL_PREFIX = 'https://duckduckgo.com/?%3Fiax=1&iax=1&ia=images&q='
  $input = $('input')
  $button = $('button')
  $dicIframe = $('iframe.dic')
  $imagesIframe = $('iframe.images')
  search = ->
    query = $input.val()
    return if query is ''

    $dicIframe.prop 'src', DIC_URL_PREFIX + query
    $imagesIframe.prop 'src', IMAGES_URL_PREFIX + query
    return

  do bindEvents = ->
    $(document).on 'keydown', (e) ->
      NUM_1_KEY = 49
      NUM_2_KEY = 50

      if e.ctrlKey and (e.which is NUM_1_KEY)
        $dicIframe.contentWindow.focus()

      if e.ctrlKey and (e.which is NUM_2_KEY)
        $imagesIframe.contentWindow.focus()

    $input.on 'keydown', (e) ->
      search() if e.which is 13

    $button.click search

  do init = ->
    $input.focus()
