# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

(($, window) -> $ ->
  project_slug = null
  level = null
  $academy_modal = $('#academy-select')

  setupListeners = ->
    $('[data-model-id]').on 'click', openModal
    $academy_modal.on 'click'
    $academy_modal.on 'click', '.btn-academy', selectAcademy
    $('.project-grid').on 'click', '.project-grid-item', selectProject
  
  selectProject = (e) ->
    $project = $ e.currentTarget
    project_slug = $project.data('project-slug')
    toggleAcademyModal(true)

  selectAcademy = (e) ->
    $academy = $ e.currentTarget
    level = $academy.data('level')
    old_location = location
    location.replace "#{old_location}/#{project_slug}/?level=#{level}"
    toggleAcademyModal()
    

  toggleModal = ($modal, toggle=false) ->
    $modal.toggleClass 'is-active', toggle

  toggleAcademyModal = (toggle) ->
    toggleModal($academy_modal, toggle)

  openModal = (e) ->
    $modal_link = $ e.currentTarget
    modal_id = $modal_link.data('modal-id')
    $modal = $ "##{modal_id}"
    $modal.addClass "is-active"

  setupListeners()

)(window.$ or window.jQuery or window.Zepto, window)
