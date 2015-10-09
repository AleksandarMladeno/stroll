define [
  'app/defines'
], (defines) ->

  'use strict'

  _game = null

  if window.history
    history.pushState { fiddle: off }, document.title

    button = document.querySelector '#fiddle'
    button.addEventListener 'click', =>
      defines.developing = on
      history.pushState { fiddle: on }, "#{document.title} (fiddling)", 'fiddle'
      button.classList.add 'invisible'
      button.setAttribute 'disabled', ''

    window.addEventListener 'popstate', (e) =>
      if _game.state.current is 'play'
        location.reload()
      else if e.state.fiddle is off
        defines.developing = off
        button.classList.remove 'invisible'
        button.removeAttribute 'disabled'

  site =
    setGame: (game) -> _game = game
