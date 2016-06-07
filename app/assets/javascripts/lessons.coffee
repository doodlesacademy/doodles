(($, window) -> $ ->

  setupListeners = ->

  appendVimeoVideo = ->
    $video = $('.video-intro')
    return unless $video.length > 0
    $intro = $('#introduction')
    video_id = $video.data('video-uri')
    return unless video_id
    video_id = video_id.replace(/[^\d]+/g, '')
    iframe_url = "https://player.vimeo.com/video/#{video_id}"
    $el = $("""
        <blockquote>
          <div class="frame frame--16x9">
            <iframe src="#{iframe_url}"
              frameborder="0"
              webkitallowfullscreen
              mozallowfullscreen
              allowfullscreen>
            </iframe>
          </div>
        </blockquote>
      """)
    $intro.after($el)

  appendInspirationImage = ->
    $inspiration_image = $('.inspiration-image')
    return unless $inspiration_image.length > 0
    url = $inspiration_image.data('large-url')
    title = '<div class="inspiration-image-title">' + $inspiration_image.data('title') + '</div>'
    description = $inspiration_image.data('description')
    $inspiration = $('#inspiration')
    $el = $("""
      <blockquote>
        <a data-toggle="modal" data-modal-id="modal-insp" class="modal-insp"><div class="insp-img-wrapper"><img src='#{url}'/><span></span></div></a>
        #{title}
        #{description}
      </blockquote>

      <div class="modal" id='modal-insp'>
        <div class="modal-content modal-full">
          <div class="modal-close"></div>
          <div class="modal-body centered">
            <img src="#{url}" />
          </div>
        </div>
      </div>
      """)

    $inspiration.after($el)

  appendInspirationImage()
  appendVimeoVideo()
  # setupListeners()

  $('.collapsible').click ->
    theId = $(this).attr('id')
    $('.' + theId + '-collapsed').toggle()
    return

  toTitleCase = (str) ->
    str.replace /\w\S*/g, (txt) ->
      txt.charAt(0).toUpperCase() + txt.substr(1).toLowerCase()

  numMainHeadSize = $('.heading').size()
  toRemove = []
  n = 0
  while n < numMainHeadSize
    mainHeading = $('h1.heading').get(n)
    headingClass = $(mainHeading).text()
    headToc = '.' + headingClass.toLowerCase() + '-toc'
    $('.lessons-toc').append('<div class=' + headingClass.toLowerCase() + '-toc' + '><h3>' + headingClass + ': </h3></div>')

    thisHead = '.' + headingClass.toLowerCase() + '-heading'
    numHead = $(thisHead).size()
    a = 0
    while a < numHead
      thisA = $(thisHead).get(a)
      aText = $(thisA).text()
      if aText.indexOf(',') != -1
        y = aText.indexOf(',') + 2
        aText = aText.substring(y, aText.length)
      aLink = '#' + aText.replace(/\s+/g, '-').toLowerCase()
      aLink = aLink.replace('/', '-')
      $(headToc).append ' <a href=' + aLink + '>' + toTitleCase(aText) + '</a> <span> > </span> '
      a++
    toRemove.push('div' + headToc + ' span:last-child')
    r = 0
    while r < toRemove.length
      $(toRemove[r]).remove()
      r++

    n++


)(window.$ or window.jQuery or window.Zepto, window)
