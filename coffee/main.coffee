$ ->
  $input = $('input')
  $button = $('button')
  $dicIframe = $('.dic')
  $imagesIframe = $('.images')
  search = ->
    query = $input.val()
    return if query is ''

    dicUrlPrefix = 'http://dic.daum.net/search.do?dic=eng&q='
    imagesUrlPrefix = 'http://images.search.yahoo.com/search/images?p='
    $dicIframe.prop 'src', dicUrlPrefix + query
    $imagesIframe.prop 'src', imagesUrlPrefix + query
    return

  $(document).on 'keydown', (e) ->
    NUM_1_KEY = 49
    NUM_2_KEY = 50

    if e.ctrlKey and (e.which is NUM_1_KEY)
      $dicIframe[0].contentWindow.focus()
      console.log('ctrl 1')

    if e.ctrlKey and (e.which is NUM_2_KEY)
      $imagesIframe.contentWindow.focus()
      console.log('ctrl 2')

  $input.on 'keydown', (e) ->
    search() if e.which is 13
    console.log 'input', e.which

  $button.click search

  $('iframe').load ->
    $input.focus()
