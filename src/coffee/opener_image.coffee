((window, $) ->
  'use strict'
  container = $ '.opener-image'
  urls = JSON.parse($('#image-urls').html()).urls
  imgEl = $ '.image-container img'
  prevButton = $ '.previous'
  nextButton = $ '.next'
  backButton = $ '.show-album .back'

  showAlbum = (e) ->
    e.preventDefault()
    url = $(this).attr('href')
    res = $.get url
    res.done (data) ->
      container.replaceWith(data)

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
  backButton.click showAlbum
) this, this.jQuery
