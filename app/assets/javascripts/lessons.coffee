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

  # appendInspirationImage()
  # appendVimeoVideo()
  # setupListeners()

  $('.collapsible').click ->
    theId = $(this).attr('id')
    $('.' + theId + '-collapsed').toggle()
    return

  console.log 'h2 in overview = ' + $('#overview').find('.overview-heading').size()
  console.log 'h2 in lesson = ' + $('#lesson').find('.lesson-heading').size()
  console.log 'h2 in extension = ' + $('#extension').find('.extension-heading').size()

  i = 0
  while i <= 11
      thisA = $('.lesson-toc a').get(i)
      aText = $(thisA).text()
      aText = '#' + aText.replace(/\s+/g, '-').toLowerCase()
      $(thisA).attr 'href', aText
      i++


)(window.$ or window.jQuery or window.Zepto, window)
