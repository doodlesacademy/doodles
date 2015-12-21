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

  hasValue = _.debounce (e) ->
    $this = $(@)
    has_value = !!($this.val() or "").length
    $this.toggleClass "has-value", has_value

  $('input').on('keydown keyup', hasValue)


  submitted = false
  # http://www.regular-expressions.info/email.html
  emailRegex = /\b[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,}\b/i
  $newsletter = $('.homepage-newsletter-signup')
  $email = $('.homepage-newsletter-signup-email')
  $email_input = $(".homepage-newsletter-signup-email .input--text")
  $message = $(".homepage-newsletter-signup-message")
  $submit = $('.homepage-newsletter-signup-submit')
  url = '/subscribe'
  dataType = "Content-Type: application/json"
  invalidEmailMsg = "Please enter a valid email address"

  emailErrorMessage = (message) ->
    $email.addClass "is-error"
    $message.text message

  handleEmailSubmission = (e) ->
    return if submitted
    email = $email_input.val() or ""
    unless email.length and emailRegex.test email
      return emailErrorMessage(invalidEmailMsg)
    submitted = true
    data =
      subscription:
        email: email

    $email.removeClass "is-error"
    $newsletter.addClass "is-loading"
    $submit.addClass "is-loading"

    request = $.ajax
      type: "POST",
      url: url,
      data: data,
      success: successfulEmailSubmission
      dataType: dataType

    request.fail(failedEmailSubmission)

  successfulEmailSubmission: ->
    $newsletter.addClass "is-success"
    $newsletter.removeClass "is-failed"
    $newsletter.removeClass "is-loading"

  failedEmailSubmission: ->
    $newsletter.addClass "is-failed"
    $newsletter.removeClass "is-loading"

  $submit.on('click', handleEmailSubmission)
  $email_input.on 'keyup keydown', _.debounce (e) ->
    if e.which is 13
      handleEmailSubmission(e)
    else if $email_input.val().length is 0
      $email.removeClass "is-error"

)(window.$ or window.jQuery or window.Zepto, window)