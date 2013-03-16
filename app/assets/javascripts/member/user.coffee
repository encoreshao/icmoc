initializeEventHandlers = () ->

  $(document).on 'click', 'td a.destroy', (e) ->
    e.preventDefault()
    url = "/settings/p/destroy_career?index="+$(this).data('value')
    deleteRemoteContent(url, null, null, null, $(this).parent().parent())


# Ajax request delete element
deleteRemoteContent = (url, data, options, callback, element) ->
  ajaxOptions =
    type: 'DELETE'
    url: url
    dataType: 'JSON'
    success: (data) -> element.remove()
    complete: () ->
      if callback then callback()
    error: (response) ->
  if options
    $.ajax $.extend( ajaxOptions, options )
  else
    $.ajax ajaxOptions

$ ->

  initializeEventHandlers()