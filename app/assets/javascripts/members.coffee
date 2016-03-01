(($, window) -> $ ->

  $members = $('.member-grid')
  $modal = $('#modal-member-bio')
  return unless $members[0] and $modal[0]

  $member_name = $modal.find('.modal-member-name')
  $body = $modal.find('.modal-body')
  $modal_close = $modal.find('.modal-close')

  toggleModal = (toggle) ->
    $modal.toggleClass "is-active", toggle

  showModal = (e) ->
    $member = $ e.currentTarget
    bio = $member.find('.member-bio').html()
    name = $member.find('.member-name').text()
    title = "About #{name}"
    changeModalContent title, bio
    toggleModal(true)
    
  changeModalContent = (title, body) ->
    $member_name.text title
    $body.html body

  $members.on 'click', '.member-grid-item', showModal
  $modal_close.on 'click', -> toggleModal(false)

)(window.$ or window.jQuery or window.Zepto, window)
