((window, $) ->
  'use strict'
  albumItem = $ '.album-item'
  container = $ '.opener-main'

  openImage = (e) ->
    e.preventDefault()
    url = $(this).find('a').attr('href')
    res = $.get url
    res.done (data) ->
      container.replaceWith(data)

  albumItem.click openImage
) this, this.jQuery
