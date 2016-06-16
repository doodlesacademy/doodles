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
  setupListeners()

  $('.collapsible').click ->
    theId = $(this).attr('id')
    $('.' + theId + '-collapsed').toggle()
    return

  toTitleCase = (str) ->
    str.replace /\w\S*/g, (txt) ->
      txt.charAt(0).toUpperCase() + txt.substr(1).toLowerCase()

  numOfh1 = $('.heading').size()
  n = 0
  while n < numOfh1
    mainHeading = $('h1.heading').get(n)
    headingClass = $(mainHeading).text()
    headToc = '.' + headingClass.toLowerCase() + '-toc'
    $('#lesson-map-sidebar').append('<p><a id="' + headingClass.toLowerCase() + '-sidebar" ' + 'class="' + headingClass.toLowerCase() + '-toc" ' + 'href="#' + headingClass.toLowerCase() + '" >' + toTitleCase(headingClass) + '</a></p>')
    thisHead = '.' + headingClass.toLowerCase() + '-heading'
    numHead = $(thisHead).size()
    a = 0
    while a < numHead
      thisA = $(thisHead).get(a)
      aText = $(thisA).text()
      if headingClass == 'Lesson'
        y = aText.indexOf(',') + 2
        aText = aText.substring(y, aText.length)
        aTextFinal = toTitleCase(aText)
      else
      aTextFinal = toTitleCase(aText)
      if aTextFinal.indexOf('/') != -1
        s = aTextFinal.indexOf('/') + 1
        beforeSlash = aTextFinal.slice(0, s)
        afterSlash = toTitleCase(aTextFinal.slice(s))
        aTextFinal = beforeSlash + afterSlash
      aLink = '#' + aText.replace(/\s+/g, '-').toLowerCase()
      aLink = aLink.replace('/', '-')
      $(headToc).append '<p id="' + aTextFinal + '-sidebar" ><a href=' + aLink + ' class="' + headingClass.toLowerCase() + '-sidebar" hidden >' + aTextFinal + '</a></p>'
      a++
    n++

    $distance = $('.lesson-title').offset().top - 80
    $window = $(window)
    $window.scroll ->
      if ($window.scrollTop() >= $distance)
          $('#lesson-map-sidebar').show()
      else
        $('#lesson-map-sidebar').hide()
      return

    overviewDistance = $('#overview').offset().top + 80
    lessonDistance = $('#lesson').offset().top + 80
    extensionDistance = $('#extension').offset().top + 80
    lessonFinishedDistance = $('h1.finished').offset().top - 20
    $window.scroll ->
      if ($window.scrollTop() >= overviewDistance) && !($window.scrollTop() > lessonDistance)
        $('.overview-sidebar').show()
        $('.lesson-sidebar').hide()
      else if ($window.scrollTop() >= lessonDistance) && !($window.scrollTop() > extensionDistance)
        $('.overview-sidebar').hide()
        $('.lesson-sidebar').show()
        $('.extension-sidebar').hide()
      else if ($window.scrollTop() > extensionDistance) && !($window.scrollTop() > lessonFinishedDistance)
        $('.lesson-sidebar').hide()
        $('.extension-sidebar').show()
      else
        $('.overview-sidebar').hide()
        $('.lesson-sidebar').hide()
        $('.extension-sidebar').hide()
      return



)(window.$ or window.jQuery or window.Zepto, window)
