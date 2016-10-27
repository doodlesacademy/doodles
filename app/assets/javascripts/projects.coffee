(($, window) -> $ ->
  project_slug = null
  level = null
  $academy_modal = $('#academy-select')

  setupListeners = ->
    $('body').on 'click', '[data-toggle="modal"]', openModal
    $academy_modal.on 'click', '.btn-academy', selectAcademy
    $('.project-grid').on 'click', '.project-grid-item', selectProject

  selectProject = (e) ->
    $project = $ e.currentTarget
    project_slug = $project.data('project-slug')
    project_id = $project.attr('id')
    unit_id = $(this).attr('id')
    unit_full_title = $project.data('unit-full-title')
    $('#unit-full-title-modal').text(unit_full_title)
    # console.log(unit_id)
    # unit_full_title = $('h2#unit-full-title')
    # unit_full_title = $('h2#unit-full-title').first().text()
    # $('#unit-full-title-modal').text(unit_full_title)
    # unit_full_title = $('h2#unit-full-title').text
    # $('#unit-number').text(project_id)
    # $('#unit-number').text(unit_full_title)
    # console.log(unit_full_title)
    # console.log(project_id)
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
