(($, window) -> $ ->
  $document = $(document)
  $nav = $('.doodles-nav')
  $dropdown_content = $('.dropdown-content')
  $body = $('.body')
  $window = $(window)
  $quote = $('#quotes p')
  $parallax = $('.parallax')
  $footerSubmit = $('#footer-submit')
  $parallax_offset = null
  $parallax_height = null
  navHeight = $nav.height()
  $lightbox = null
  $close_btn = null
  scrollClass = "is-scrolled"

  getUrlVars = ->
    vars = {}
    url = decodeURIComponent(window.location.href.replace(/\+/g, '%20'))
    parts = url.replace(/[?&]+([^=&]+)=([^&]*)/gi, (m, key, value) ->
      vars[key] = value
      return
    )
    vars

  text = getUrlVars()['email-submit']

  $('#mce-EMAIL').val(text)


  onScroll = ->
    top = $document.scrollTop()
    hasScrolled = top > navHeight
    $nav.toggleClass(scrollClass, hasScrolled)
    $nav.removeClass('hidden')

  onScroll = _.debounce(onScroll)

  onScroll()

  $window.scroll(onScroll)

  $('.dropdown').hover (->
    $(this).find('.dropdown-content').show()
    return
  ), ->
    $('.dropdown-content').hide()
    return

  VIDEO_EMBED =
    vimeo: _.template "https://player.vimeo.com/video/<%= video_id %>?autoplay=1"

  lightbox_template = _.template """
    <div class="lightbox">
      <div class="lightbox-bg"></div>
      <div class="lightbox-modal">
        <div class="frame frame--16x9">
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


  gal_images = ['gal1.jpg', 'gal2.jpg', 'gal3.jpg', 'gal4.jpg', 'gal5.jpg']

  img_number = 0
  left_gal_img = gal_images[img_number + 1]
  right_gal_img = gal_images[img_number]

  $('.img_left').attr("src", "assets/#{left_gal_img}")
  $('.img_right').attr("src", "assets/#{right_gal_img}")

  $('.right-arrow').click ->
    if img_number == 4
      console.log 'hello'
      left_gal_img = 'gal2.jpg'
      right_gal_img = 'gal1.jpg'
      img_number = 0
    else if img_number == 3
      left_gal_img = 'gal1.jpg'
      right_gal_img = 'gal5.jpg'
      img_number = 4
    else
      img_number += 1
      left_gal_img = gal_images[img_number + 1]
      right_gal_img = gal_images[img_number]
    $('.img_left').attr("src", "assets/#{left_gal_img}")
    $('.img_right').attr("src", "assets/#{right_gal_img}")
    return

  $('.left-arrow').click ->
    if img_number == 0
      left_gal_img = 'gal1.jpg'
      right_gal_img = 'gal5.jpg'
      img_number = 4
    else
      img_number -= 1
      left_gal_img = gal_images[img_number + 1]
      right_gal_img = gal_images[img_number]
    $('.img_left').attr("src", "assets/#{left_gal_img}")
    $('.img_right').attr("src", "assets/#{right_gal_img}")
    return


  quotes = [
    'Since [our daughter’s] school doesn\'t have an art curriculum, she has not been able to explore and learn about her passion until now. She has become more confident, articulate and definitely much happier since she\'s been enrolled in Doodles.'
    'With no art classes at her school, my daughter was floundering–always sketching, but frustrated by her lack of direction... We are grateful for the excellent guidance provided by Doodles Academy, which has filled a void in our daughter’s life.'
    'The online art classes provided by Doodles Academy are invaluable to me as a homeschool mom and teacher... I also appreciate the flexibility of the program. We can adjust it to our life, schedule, and health.'
    'I absolutely love your website and have begun to use it in my classroom quite frequently ... some of my students love the website so much that they have done some lessons on their own at home.'
  ]
  quotePersons = [
    'Kara Bloom'
    'Laura Harris'
    'Erin Scott'
    'Julie Rains'
  ]
  quoteNumber = 0
  lastQuote = quotes.length
  $('#quotes p').append quotes[quoteNumber]
  $('.quoted-parent').append '<p>' + quotePersons[quoteNumber] + '</p>'
  $('#dot' + quoteNumber + ' img').attr("src", "assets/bluedot.png");

  nextQuote = ->
    $("#dot#{lastQuote} img").attr 'src', 'assets/dot.png'
    $('#quotes p').text quotes[quoteNumber]
    $('.quoted-parent p').text quotePersons[quoteNumber]
    $("#dot#{quoteNumber} img").attr 'src', 'assets/bluedot.png'
    if quoteNumber < quotes.length - 1 then (quoteNumber += 1) else (quoteNumber = 0)
    if lastQuote < quotes.length - 1 then (lastQuote += 1) else (lastQuote = 0)
    setTimeout nextQuote, 8000
    return

  setTimeout nextQuote, 8000

  clickDots = ->
    $('#quotes p').text(quotes[quoteNumber])
    $('.quoted-parent p').text(quotePersons[quoteNumber])
    nums = [ 0..quotes.length ]
    nums.forEach (i) ->
      dot = if i == quoteNumber then 'bluedot' else 'dot'
      $("#dot#{i} img").attr 'src', "assets/#{dot}.png"
      return
    return

  $('.dot').click ->
    quoteNumber = Number /\d/.exec(this.id)[0] 
    clickDots quoteNumber
    return

  return

  # Email submission
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

  $('.collapsible').click ->
    theId = $(this).attr('id')
    $('.' + theId + '-collapsed').toggle()
    return

)(window.$ or window.jQuery or window.Zepto, window)
