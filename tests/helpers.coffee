define [
  'phaser'
  'underscore'
], (Phaser, _) ->

  createFakePlayerProps: (player) ->
    sprite:
      body: 
        drag: new Phaser.Point(), setSize: jasmine.createSpy 'setSize'
        velocity: new Phaser.Point(), acceleration: new Phaser.Point()
      game:
        time: { create: -> new Phaser.Timer player.sprite.game }
      scale: new Phaser.Point()
    animations:
      play: jasmine.createSpy('play').and.callFake (name) ->
        { isFinished: no, isPlaying: yes, loop: off, name: name }
      frame: 17
    cursors:
      _.mapObject { left: {}, right: {}, up: {}, down: {} }, (key) ->
        key.isUp = key.isDown = no; key
