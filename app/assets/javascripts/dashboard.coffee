(($, window) -> $ ->

  $('#camera-icon').click ->
    $('input[type=file]').click()
    return

  $('.pencil-icon:first-of-type').click ->
    $('#edit-name').show()
    return

)(window.$ or window.jQuery or window.Zepto, window)
