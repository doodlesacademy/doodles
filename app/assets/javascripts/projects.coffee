(($, window) -> $ ->
  project_slug = null
  level = null
  $academy_modal = $('#academy-select')

  setupListeners = ->
    $('body').on 'click', '[data-toggle="modal"]', openModal
    $academy_modal.on 'click', '.btn-academy', selectAcademy
    $('.project-grid').on 'click', '.project-grid-item', selectProject

  project_title_text = []
  project_title_text.push $('.project-grid-item-title ')
  i = 0
  while i < project_title_text[0].length
    title_div = project_title_text[0][i]
    text = $(title_div).text()
    if text.length > 15
      $(title_div).css('font-size', '0.95em')
    i++

  selectProject = (e) ->
    $project = $ e.currentTarget
    project_slug = $project.data('project-slug')
    project_id = $project.attr('id')
    unit_id = $(this).attr('id')
    unit_full_title = $project.data('unit-full-title')
    $('#unit-full-title-modal').text(unit_full_title)
    project_title = $project.data('project-title')
    $('#project-title-modal').text('PROJECT : ' + project_title)
    project_synopsis = $project.data('project-synopsis')
    $('#project-synopsis-modal').text(project_synopsis)
    project_featured_image = $project.data('project-featured-image')
    $('#project-featured-image-modal').attr('src', project_featured_image)
    toggleAcademyModal(true)

  selectAcademy = (e) ->
    $academy = $ e.currentTarget
    level = $academy.data('level')
    location = window.location.toString()
    location = location.replace('projects', "#{level}/projects")
    window.location = "#{location}/#{project_slug}"
    toggleAcademyModal()

  toggleModal = ($modal, toggle=false) ->
    $modal.toggleClass 'is-active', toggle
    $modal.on 'click.close-modal', '.modal-close', (e) ->
      toggleModal($modal)
      $modal.off '.close-modal'

  toggleAcademyModal = (toggle) ->
    toggleModal($academy_modal, toggle)

  openModal = (e) ->
    $modal_link = $ e.currentTarget
    modal_id = $modal_link.data('modal-id')
    $modal = $ "##{modal_id}"
    toggleModal($modal, true)

  setupListeners()

)(window.$ or window.jQuery or window.Zepto, window)
