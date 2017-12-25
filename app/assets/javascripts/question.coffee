# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'change', '#large_area', ->
  $.ajax(
    type: 'GET'
    url: '/questions/small_classification'
    cache:false
    data: {
      large_classification_id: $(this).val()
    }
  ).done (data) ->
    $('#small_area').html(data)
