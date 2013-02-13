$(document).on ['ready','nested:fieldAdded'], (event) ->
  if (field in event)
    selector = $('input[type="file"]', event.field)
  else
    selector = $('input[type="file"]')
  selector.on 'change', (el) ->
  fake = $(el.target).siblings('.fakefile').find('input')
  if fake then fake.val(el.target.files[0].name)
