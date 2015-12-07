((window, $) ->
  'use strict'
  urls = JSON.parse($('#image-urls').html()).urls
  imgEl = $ '.image-container img'
  prevButton = $ '.previous'
  nextButton = $ '.next'

  loadImage = (imgIndex) ->
    if imgIndex < 0 || imgIndex >= urls.length
      return

    imgEl.data('index', imgIndex)
    imgEl.fadeOut ->
      imgEl.attr('src', urls[imgIndex])
      imgEl.fadeIn()

    if imgIndex == 0
      prevButton.css('visibility', 'hidden')
    else
      prevButton.css('visibility', 'visible')

    if imgIndex == urls.length - 1
      nextButton.css('visibility', 'hidden')
    else
      nextButton.css('visibility', 'visible')

  prevImage = (e) ->
    loadImage(parseInt(imgEl.data('index'), 10) - 1)
    e.preventDefault()

  nextImage = (e) ->
    loadImage(parseInt(imgEl.data('index'), 10) + 1)
    e.preventDefault()

  prevButton.click prevImage
  nextButton.click nextImage
) this, this.jQuery
