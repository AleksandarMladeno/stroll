# App
# ===
# Highest-level application script.

# Dependencies
# ------------
# Configure RequireJS. Dependency references default to the `lib` directory.
# We're using CoffeeScript, so our `app` package code is in the compiled js
# directory `release`.
requirejs.config
  baseUrl: 'lib'
  paths:
    app: '../release'
requirejs [
  'phaser'
  'app/game'
],
(Phaser, MorningStroll) ->

  'use strict'

  # Global flags
  # ------------

  window.DEBUG = on

  # Main
  # ----

  # Run our game.
  game = new MorningStroll()
  game.start()

  # Debug
  # -----
  # Block of additions for debugging the app. Exposes classes and instances as
  # globals.
  if window.DEBUG is on
    window.Phaser = Phaser
    window.game = game
    console.info game