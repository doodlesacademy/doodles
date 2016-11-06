(($, window) -> $ ->
  project_slug = null
  level = null
  $academy_modal = $('#academy-select')

  setupListeners = ->
    $('body').on 'click', '[data-toggle="modal"]', openModal
    $academy_modal.on 'click', '.btn-academy', selectAcademy
    $('.project-grid').off().on 'click', '.project-grid-item', selectProject

  selectProject = (e) ->
    $project = $ e.currentTarget
    project_slug = $project.data('project-slug')
    project_id = $project.attr('id')
    $('#academy-select').find('.modal-content').attr('id', project_id)
    unit_full_title = $project.data('unit-full-title')
    $('#unit-full-title-modal').text(unit_full_title)
    project_title = $project.data('project-title')
    $('#project-title-modal').text('PROJECT : ' + project_title)
    project_synopsis = $project.data('project-synopsis')
    $('#project-synopsis-modal').text(project_synopsis)
    project_featured_image = $project.data('project-featured-image')
    $('#project-featured-image-modal').attr('src', project_featured_image)
    lower_project_id = $project.data('project-lower-id')
    upper_project_id = $project.data('project-upper-id')
    favorite_lower = $project.data('favorite-lower')
    favorite_upper = $project.data('favorite-upper')

    # clean up a little bit - dry up handling favorites

    handleFavorite = (level, level_project_id, favorite_or_unfavorite) ->
      $('.save-project-' + level).off().on 'click', ->
        iteration = $(this).data('iteration') or 1
        switch iteration
          when 1
            $('#modal-' + level + '-favorite-star span').text('☆')
            $project.data('favorite-' + level, false)
            $.ajax
              type: 'PUT'
              url: '/projects/' + level_project_id + '/favorite?type=unfavorite' 
          when 2
            $('#modal-' + level + '-favorite-star span').text('★')
            $project.data('favorite-' + level, true)
            $.ajax
              type: 'PUT'
              url: '/projects/' + level_project_id + '/favorite?type=favorite'
        iteration++
        if iteration > 2
          iteration = 1
        $(this).data 'iteration', iteration
        return

    if favorite_lower
      $('.save-project-lower').data('iteration', 1)
      $('#modal-lower-favorite-star span').text('★')
      handleFavorite 'lower', lower_project_id, 'unfavorite'
    else
      $('.save-project-lower').data('iteration', 2)
      $('#modal-lower-favorite-star span').text('☆')
      handleFavorite 'lower', lower_project_id, 'favorite'
    toggleAcademyModal(true)

    if favorite_upper
      $('.save-project-upper').data('iteration', 1)
      $('#modal-upper-favorite-star span').text('★')
      handleFavorite 'upper', upper_project_id, 'unfavorite'
    else
      $('.save-project-upper').data('iteration', 2)
      $('#modal-upper-favorite-star span').text('☆')
      handleFavorite 'upper', upper_project_id, 'favorite'
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
