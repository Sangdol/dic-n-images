// Generated by CoffeeScript 1.6.2
(function() {
  $(function() {
    var $button, $dicIframe, $imagesIframe, $input, search;

    $input = $('input');
    $button = $('button');
    $dicIframe = $('.dic');
    $imagesIframe = $('.images');
    search = function() {
      var dicUrlPrefix, imagesUrlPrefix, query;

      query = $input.val();
      if (query === '') {
        return;
      }
      dicUrlPrefix = 'http://endic.naver.com/search.nhn?sLn=en&searchOption=all&query=';
      imagesUrlPrefix = 'http://images.search.yahoo.com/search/images?p=';
      $dicIframe.prop('src', dicUrlPrefix + query);
      $imagesIframe.prop('src', imagesUrlPrefix + query);
    };
    $(document).on('keydown', function(e) {
      var NUM_1_KEY, NUM_2_KEY;

      NUM_1_KEY = 49;
      NUM_2_KEY = 50;
      if (e.ctrlKey && (e.which === NUM_1_KEY)) {
        $dicIframe[0].contentWindow.focus();
        console.log('ctrl 1');
      }
      if (e.ctrlKey && (e.which === NUM_2_KEY)) {
        $imagesIframe.contentWindow.focus();
        return console.log('ctrl 2');
      }
    });
    $input.on('keydown', function(e) {
      if (e.which === 13) {
        search();
      }
      return console.log('input', e.which);
    });
    $button.click(search);
    return $('iframe').load(function() {
      return $input.focus();
    });
  });

}).call(this);
