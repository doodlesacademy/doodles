(($, window) -> $ ->

  $members = $('.member-grid')
  $modal = $('#modal-member-bio')
  return unless $members[0] and $modal[0]

  $title= $modal.find('.modal-member-name')
  $photo = $modal.find('.modal-baby-picture')
  $body = $modal.find('.modal-body')
  $modal_close = $modal.find('.modal-close')

  toggleModal = (toggle) ->
    $modal.toggleClass "is-active", toggle

  showModal = (e) ->
    $member = $(e.currentTarget)
    name = $member.find('.member-name').text()
    changeModalContent
      title: "About #{name}"
      body: $member.find('.member-bio').html()
      photo: $member.find('.member-baby-picture').html()
    toggleModal(true)
    
  changeModalContent = ({title, body, photo}) ->
    $title.text title

    $body.empty() 
    $body.append body

    $photo.empty()
    $photo.append photo

  $members.on 'click', '.member-grid-item', showModal
  $modal_close.on 'click', -> toggleModal(false)

)(window.$ or window.jQuery or window.Zepto, window)
