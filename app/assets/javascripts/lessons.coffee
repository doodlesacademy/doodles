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

  numOverviewHead = $('.overview-heading').size()
  headerA = $('h1.overview-head').text()
  $('.overview-toc').append '<h3>' + headerA + ': </h3>'
  a = 0
  while a < numOverviewHead
    thisA = $('.overview-heading').get(a)
    aText = $(thisA).text()
    aLink = '#' + aText.replace(/\s+/g, '-').toLowerCase()
    $('.overview-toc').append ' <a href=' + aLink + '>' + toTitleCase(aText) + '</a> <span> > </span> '
    a++
  $('div.overview-toc span:last-child').remove()


  numLessonHead = $('.lesson-heading').size()
  headerB = $('h1.lesson-head').text()
  $('.lessons-toc').append '<h3>' + headerB + ': </h3>'
  b = 0
  while b < numLessonHead
    thisB = $('.lesson-heading').get(b)
    bText = $(thisB).text()
    bText = bText.substring(bText.indexOf(',') + 1, bText.length)
    bLink = '#' + bText.replace(/\s+/g, '-').toLowerCase()
    $('.lessons-toc').append (b+1) + ' <a href=' + bLink + '>' + toTitleCase(bText) + '</a> <span> > </span>'
    b++
  $('div.lessons-toc span:last-child').remove()


  numExtensionHead = $('.extension-heading').size()
  headerC = $('h1.extension-head').text()
  $('.extension-toc').append '<h3>' + headerC + ': </h3>'
  c = 0
  while c < numExtensionHead
    thisC = $('.extension-heading').get(c)
    cText = $(thisC).text()
    cText = cText.substring(cText.indexOf(',') + 1, cText.length)
    cLink = '#' + cText.replace(/\s+/g, '-').toLowerCase()
    $('.extension-toc').append ' <a href=' + cLink + '>' + toTitleCase(cText) + '</a> <span> > </span>'
    c++
  $('div.extension-toc span:last-child').remove()


)(window.$ or window.jQuery or window.Zepto, window)
