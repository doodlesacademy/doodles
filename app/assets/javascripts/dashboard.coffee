(($, window) -> $ ->

  $('.pencil-icon:first-of-type').click ->
    $('#edit-name').show()
    return

  $('#camera-icon').click ->
    $('#user_profile_attributes_avatar').trigger 'click'
    return

  $('#user_profile_attributes_avatar').change ->
      $('#update-avatar').trigger 'click'
    return


)(window.$ or window.jQuery or window.Zepto, window)
