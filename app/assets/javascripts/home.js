$(function() {
  console.log("herllo")
  var $document = $(document)
    , $nav = $('.nav')
    , $window = $(window);

  var onScroll = function() {
    var top = $document.scrollTop()
      , smallClass = "small"
      , hasScrolled = top > 50;

    $nav.toggleClass(smallClass, hasScrolled);
    if (!hasScrolled) {
      $nav.removeClass("flex");
    }

    $nav.on("transitionend", function() {
      $nav.toggleClass("flex", hasScrolled);
    })
  }

  onScroll = _.debounce(onScroll);

  $window.scroll(onScroll);
});