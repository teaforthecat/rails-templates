fake_file_init = (scope) ->
  $('input[type="file"]', scope).on 'change', (el) ->
    fake = $(el.target).siblings('.fakefile').find('input')
    if fake
      fake.val(el.target.files[0].name)


$(document).on 'nested:fieldAdded', (event) ->
  fake_file_init(event.field)

$(document).ready ->
  fake_file_init($('form'))
