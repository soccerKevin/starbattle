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

$ ->
  window.main = new Main()
