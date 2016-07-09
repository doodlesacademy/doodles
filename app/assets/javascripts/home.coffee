(($, window) -> $ ->
  $document = $(document)
  $nav = $('.doodles-nav')
  $body = $('.body')
  $window = $(window)
  $quote = $('.quote .quote-contents')
  $parallax = $('.parallax')
  $parallax_offset = null
  $parallax_height = null
  navHeight = $nav.height()
  $lightbox = null
  $close_btn = null
  scrollClass = "is-scrolled"

  onScroll = ->
    top = $document.scrollTop()
    hasScrolled = top > navHeight
    $nav.toggleClass(scrollClass, hasScrolled)
    $nav.removeClass('hidden')

  onScroll = _.debounce(onScroll)

  onScroll()

  $window.scroll(onScroll)

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

  # Quotes
  # quotes = []
  # quotes.push
  #   content: 'Since [our daughter\’s] school doesn\'t have an art curriculum, she has not been able to explore and learn about her passion until now. She has become more confident, articulate and definitely much happier since she\'s been enrolled in Doodles.'
  #   person: "Kara Bloom"
  # quotes.push
  #   content: 'With no art classes at her school, my daughter was floundering–always sketching, but frustrated by her lack of direction... We are grateful for the excellent guidance provided by Doodles Academy, which has filled a void in our daughter\’s life.'
  #   person: "Laura Harris"
  # quotes.push
  #   content: 'The online art classes provided by Doodles Academy are invaluable to me as a homeschool mom and teacher... I also appreciate the flexibility of the program. We can adjust it to our life, schedule, and health.'
  #   person: "Erin Scott"
  #
  # quote_rotate_speed = 8000
  # quote_rotate_interval = null
  # quote_rotate_current_index = 0
  #
  # "content person".split(" ").map (selector) ->
  #   $quote.append("<div class='quote-#{selector}'></div>")
  #   # $quote.append("<div class='quote-#{selector}'></div>")
  # $quote_content = $quote.find('.quote-content')
  # $quote_person = $quote.find('.quote-person')
  # $quote_selector = $('.quote .quote-selector')
  #
  # initQuotes = ->
  #   quotes.map (quote, index) ->
  #     $selector = $ "<i class='quote-selector-bubble' data-quote-id='#{index}'>•</i>"
  #     $quote_selector.append $selector
  #
  #   $quote_selector.on 'click', '.quote-selector-bubble', (e) ->
  #     $target = $(e.currentTarget)
  #     quote_id = $target.data('quote-id')
  #     selectQuote(quote_id)
  #     quote_rotate_current_index = quote_id
  #
  #   $('.quote').on 'mouseenter', ->
  #     clearInterval quote_rotate_interval
  #
  #   $('.quote').on 'mouseleave', ->
  #     rotateQuotes()
  #
  #   selectQuote()
  #   rotateQuotes()
  #
  # rotateQuotes = ->
  #   quote_rotate_interval = setInterval ->
  #     i = quote_rotate_current_index += 1
  #     i = i % 3
  #     selectQuote(i)
  #   , quote_rotate_speed
  #
  # setActiveBubble = (active_index = 0) ->
  #   return unless 0 <= active_index < quotes.length
  #   $quote_selector.children().map (index, bubble) ->
  #     $bubble = $(bubble)
  #     $bubble.toggleClass "is-active", index is active_index
  #
  # selectQuote = (index = 0) ->
  #   return unless 0 <= index < quotes.length
  #   quote = quotes[index]
  #   toggleQuote()
  #   setActiveBubble(index)
  #   $quote.one "transitionend", ->
  #     switchQuote(quote)
  #     toggleQuote()
  #
  # toggleQuote = (hide) ->
  #   hide ?= not $quote.hasClass "is-hidden"
  #   $quote.toggleClass "is-hidden", hide
  #
  # switchQuote = (quote) ->
  #   return unless quote? and quote.person? and quote.content?
  #   $quote_content.text quote.content
  #   $quote_person.text quote.person
  #
  # initQuotes()
  $quote_content = undefined
  quotePersons = undefined
  $quote_person = undefined
  $quote_selector = undefined
  initQuotes = undefined
  quote_rotate_current_index = undefined
  quote_rotate_interval = undefined
  quote_rotate_speed = undefined
  quotes = undefined
  rotateQuotes = undefined
  selectQuote = undefined
  setActiveBubble = undefined
  switchQuote = undefined
  toggleQuote = undefined
  quotes = [
    'Since [our daughter’s] school doesn\'t have an art curriculum, she has not been able to explore and learn about her passion until now. She has become more confident, articulate and definitely much happier since she\'s been enrolled in Doodles.'
    'With no art classes at her school, my daughter was floundering–always sketching, but frustrated by her lack of direction... We are grateful for the excellent guidance provided by Doodles Academy, which has filled a void in our daughter’s life.'
    'The online art classes provided by Doodles Academy are invaluable to me as a homeschool mom and teacher... I also appreciate the flexibility of the program. We can adjust it to our life, schedule, and health.'
  ]
  quotePersons = [
    'Kara Bloom'
    'Laura Harris'
    'Erin Scott'
  ]
  quote_number = 0
  $('.quote-contents').append quotes[quote_number]
  $('.quote-sayer').append '<p>' + quotePersons[quote_number] + '</p>'

  nextQuote = ->
    $('.quote-contents').text quotes[quote_number = ++quote_number % quotes.length]
    $('.quote-sayer p').text quotePersons[quote_number = ++quote_number % quotePersons.length]
    setTimeout nextQuote, 5000
    return

  setTimeout nextQuote, 5000
  # need to reset setTimeout on click
  $('#right-arrow').click ->
    if quote_number == 2
      quote_number = 0
    else
      quote_number += 1
    $('.quote-contents').text(quotes[quote_number])
    $('.quote-sayer p').text(quotePersons[quote_number])
    return

  $('#left-arrow').click ->
    if quote_number == 0
      quote_number = 2
    else
      quote_number -= 1
    $('.quote-contents').text(quotes[quote_number])
    $('.quote-sayer p').text(quotePersons[quote_number])
    return

  $('#dot0').click ->
    quote_number = 0
    $('.quote-contents').text(quotes[quote_number])
    $('.quote-sayer p').text(quotePersons[quote_number])
    return

  $('#dot1').click ->
    quote_number = 1
    $('.quote-contents').text(quotes[quote_number])
    $('.quote-sayer p').text(quotePersons[quote_number])
    return

  $('#dot2').click ->
    quote_number = 2
    $('.quote-contents').text(quotes[quote_number])
    $('.quote-sayer p').text(quotePersons[quote_number])
    return

  return

  # $('#right-arrow').click ->
  #   if quote_number == 2
  #     quote_number = 0
  #   else
  #     quote_number += 1
  #   $('.quote-contents').text(quotes[quote_number])
  #   $('.quote-sayer p').text(quotePersons[quote_number])
  #   return

  # $('#left-arrow').click ->
  #   if quote_number == 0
  #     quote_number = 2
  #   else
  #     quote_number -= 1
  #   $('.quote-contents').text(quotes[quote_number])
  #   $('.quote-sayer p').text(quotePersons[quote_number])
  #   return
  #
  # $('#dot0').click ->
  #   quote_number = 0
  #   $('.quote-contents').text(quotes[quote_number])
  #   $('.quote-sayer p').text(quotePersons[quote_number])
  #   return
  #
  # $('#dot1').click ->
  #   quote_number = 1
  #   $('.quote-contents').text(quotes[quote_number])
  #   $('.quote-sayer p').text(quotePersons[quote_number])
  #   return
  #
  # $('#dot2').click ->
  #   quote_number = 2
  #   $('.quote-contents').text(quotes[quote_number])
  #   $('.quote-sayer p').text(quotePersons[quote_number])
  #   return

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

)(window.$ or window.jQuery or window.Zepto, window)
