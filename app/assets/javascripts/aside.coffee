(($, window) -> $ ->

  $document = $(document)
  $window = $(window)
  $aside = $('.aside')
  $content = $('.content')
  return unless $aside[0] and $content[0]

  aside_height = $aside.height()
  content_height = $content.height()
  aside_offset = null
  content_offset = null
  margin = 100

  onScroll = _.debounce ->
    aside_offset or= $aside.offset()
    content_offset or= $content.offset()
    document_top = $document.scrollTop()
    bottom = "inherit"
    if document_top + margin > aside_offset.top
      if document_top + margin + aside_height > content_offset.top + content_height
        bottom = "0px"
        top = "inherit"
        left = 0
        position = "absolute"
      else
        top = "#{margin}px"
        left = aside_offset.left
        position = "fixed"
    else
      top = 0
      left = 0
      position = "absolute"
    $aside.css
      position: position
      top: "#{top}"
      left: "#{left}px"
      bottom: "#{bottom}"

  onScroll()
  $window.scroll(onScroll)

)(window.$ or window.jQuery or window.Zepto, window)
