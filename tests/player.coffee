define [
  'phaser'
  'underscore'
  'app/player'
  'test/helpers'
], (Phaser, _, Player, helpers) ->

  describe 'Player', ->
    game = null
    player = null

    beforeEach ->
      spyOn Player::, '_initialize'
      player = new Player()
      spyOn(player, method).and.callThrough() for method in [
        '_beginJump'
        '_beginRun'
        '_beginTurn', '_endTurn'
        '_playAnimation'
      ]
      _.extend player, helpers.createFakePlayerProps(player)

      player._initPhysics()
      player._initState()

    testStartAnimation = ->
      it 'will play start animation', ->
        expect(player.nextAction).toBe 'start'
        expect(player._playAnimation).toHaveBeenCalledWith 'start', undefined

    describe 'when initialized', ->
      it 'is set to still and facing right', ->
        expect(player.state).toBe 'still'
        expect(player.direction).toBe Player.Direction.Right
        expect(player.animation).toBeNull()

      it 'has no next state info', ->
        expect(player.nextAction).toBe 'none'
        expect(player.nextDirection).toBeNull()
        expect(player.nextState).toBeNull()

    describe 'when x cursor key is down in same direction', ->
      beforeEach ->
        player.cursors.right.isDown = yes
        player.update()

      it 'can get and set the right direction from #_xDirectionInput', ->
        expect(player._xDirectionInput()).toBe Player.Direction.Right
        expect(player.nextDirection).toBe Player.Direction.Right

      describe 'when still', ->
        it 'will begin to run', ->
          expect(player.state).toBe 'running'
          expect(player._beginRun).toHaveBeenCalled()

        testStartAnimation()

    describe 'when x cursor key is down in opposite direction', ->
      beforeEach ->
        player.cursors.left.isDown = yes
        player.update()

      it 'can get and set the right direction from #_xDirectionInput', ->
        expect(player._xDirectionInput()).toBe Player.Direction.Left
        expect(player.nextDirection).toBe Player.Direction.Left

      describe 'when still', ->
        it 'will immediately (end) turn and begin to run', ->
          expect(player._isTurning).toBe yes
          expect(player.direction).toBe Player.Direction.Left
          expect(player._beginRun).toHaveBeenCalled()

        testStartAnimation()
