(($, window) -> $ ->

  appendVimeoVideo = ->
    debugger
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
    description = $inspiration_image.data('description')
    $inspiration = $('#inspiration')
    $el = $("""
      <blockquote>
        <img src='#{url}'/>
        #{description}
      </blockquote>
      """)

    $inspiration.after($el)


  appendInspirationImage()
  appendVimeoVideo()

)(window.$ or window.jQuery or window.Zepto, window)
