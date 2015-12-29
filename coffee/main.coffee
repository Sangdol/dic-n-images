$ ->
  DIC_URL_PREFIX = 'http://alldic.daum.net/search.do?dic=eng&q='
  IMAGES_URL_PREFIX = 'https://duckduckgo.com/?%3Fiax=1&iax=1&ia=images&q='
  $input = $('input')
  $search= $('#search')
  $x = $('#x')
  $dicIframe = $('iframe.dic')
  $imagesIframe = $('iframe.images')
  $toggle = $('.toggle')
  $iframes = $('iframe')

  search = ->
    query = $input.val()
    return if query is ''

    $dicIframe.prop 'src', DIC_URL_PREFIX + query
    $imagesIframe.prop 'src', IMAGES_URL_PREFIX + query
    return

  do bindEvents = ->
    $input.on 'keydown', (e) ->
      search() if e.which is 13

    $search.click search
    $x.click ->
      $input.val ''

    $toggle.on 'click tap', ->
      $iframes.toggle()
      return false

    return

  do init = ->
    $input.focus()
