# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'change', '#big_area', ->
  $.ajax(
    type: 'GET'
    url: '/question_wanteds/small_classification'
    cache:false
    data: {
      big_catergory_id: $(this).val()
    }
  ).done (data) ->
    $('#small_area').html(data)
