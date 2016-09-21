class Main
  constructor: ->
    @map = new Map()
    @controls = $('.controls')
    @handlers()

  startGame: ->
    @controls.find('.next_group').hide()

  handlers: ->
    @nextGroupHandler()
    @startGameHandler()
    @findGameHandler()
    @saveHandler()

  nextGroupHandler: ->
    @controls.on 'click', '.next_group', =>
      @map.currentGroup().paintBackground()
      @map.nextGroup()

  startGameHandler: ->
    @controls.on 'click', '.start_game', =>
      @startGame()

  saveHandler: ->
    @controls.on 'click', '.save_map', =>
      @map.save()

  findGameHandler: ->
    @controls.on 'click', '.find_map', =>
      @map.find @controls.find('.map_index').val()

    @controls.on 'keyup', '.map_index', (e)=>
      @map.find @controls.find('.map_index').val() if e.keyCode == 13

$ ->
  window.main = new Main()
