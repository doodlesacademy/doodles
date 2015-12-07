$(function() {
  var $document = $(document)
    , $nav = $('.nav')
    , $window = $(window)
    , $fixedNav = $nav.clone().appendTo("body")
    , navHeight = $nav.height();

  $fixedNav.addClass("is-fixed");

  var onScroll = function() {
    var top = $document.scrollTop()
      , scrollClass = "is-scrolled"
      , hasScrolled = top > navHeight;

    $fixedNav.toggleClass(scrollClass, hasScrolled);
  }

  onScroll = _.debounce(onScroll);

  onScroll();

  $window.scroll(onScroll);
});