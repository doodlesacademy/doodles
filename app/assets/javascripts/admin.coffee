(($, window) -> $ ->

  window.addEventListener "dragover", (e) ->
    e or= event
    e.preventDefault()
  , false
  window.addEventListener "drop", (e) ->
    e or= event
    e.preventDefault()
  , false

  $md_editor = null
  retries = 0
  findEl = ->
    $md_editor = $('.uk-htmleditor')
    return setupHandler() if $md_editor.length > 0
    if retries < 10
      setTimeout ->
        retries++
        findEl()
      , 1000

  findEl()

  setupHandler = ->
    $md_editor.on 'dragenter dragover', handleDragOver
    $md_editor.on 'dragleave', handleDragLeave
    $md_editor.on 'dragdrop drop', handleDrop

  handleDragOver = (e) ->
    e.preventDefault()
    e.stopPropagation()
    $md_editor.css
      boxShadow: '0px 0px 5px aqua'

  handleDragLeave = (e) ->
    e.preventDefault()
    e.stopPropagation()
    console.log('Left: ' + e)
    $md_editor.css
      boxShadow: 'none'

  handleDrop = (e) ->
    ev = e.originalEvent
    debugger
    ev.preventDefault()
    ev.stopPropagation()
    dt = ev.dataTransfer
    f = dt.files

)(window.$ or window.jQuery or window.Zepto, window)
