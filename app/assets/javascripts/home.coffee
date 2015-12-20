(($, window) -> $ ->
  $document = $(document)
  $nav = $('.nav')
  $body = $('.body')
  $window = $(window)
  $fixedNav = $nav.clone().appendTo("body")
  navHeight = $nav.height()
  $lightbox = null
  $close_btn = null

  $fixedNav.addClass("is-fixed")

  onScroll = ->
    top = $document.scrollTop()
    scrollClass = "is-scrolled"
    hasScrolled = top > navHeight
    $fixedNav.toggleClass(scrollClass, hasScrolled)

  onScroll = _.debounce(onScroll)

  onScroll()

  $window.scroll(onScroll)

  VIDEO_EMBED =
    vimeo: _.template "https://player.vimeo.com/video/<%= video_id %>?autoplay=1"


  lightbox_template = _.template """
    <div class="lightbox">
      <div class="lightbox-bg"></div>
      <div class="lightbox-modal">
        <div class="lightbox-frame">
          <iframe src="<%= iframe_url %>"
            frameborder="0"
            webkitallowfullscreen
            mozallowfullscreen
            allowfullscreen>
          </iframe>
        </div>
        <div class="lightbox-close-btn"></div>
      </div>
    </div>"""


  closeOnEscape = (e) ->
    return unless e.which is 27
    $window.off '.close-video'
    closeVideo()

  closeVideo = ->
    $lightbox.on "transitionend", ->
      $lightbox?.detach()
      $lightbox = null

    $lightbox.addClass "is-closing"

  showVideo = ->
    $el = $(this)
    video_service = $el.data('video-service') or 'vimeo'
    video_id = $el.data('video-id')
    project_title = $el.data('project-title')
    iframe_url = VIDEO_EMBED[video_service] { video_id }
    lightbox = lightbox_template { iframe_url, project_title }

    $lightbox = $(lightbox)
    $lightbox.appendTo('body')
    $close = $lightbox.find('.lightbox-close-btn, .lightbox-bg')
    $close.on 'click', closeVideo
    $window.on 'keyup.close-video', closeOnEscape
    $lightbox.addClass "is-opened"

  $('div[data-video-id]').on('click', showVideo)

)(window.$ or window.jQuery or window.Zepto, window)