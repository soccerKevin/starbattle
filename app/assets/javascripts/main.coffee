class Main
  constructor: ->
    @map = new Map()
    @controls = $('.controls')
    @handlers()

  handlers: ->
    @nextGroupHandler()
    @startGameHandler()

  nextGroupHandler: ->
    @controls.on 'click', '.next_group', =>
      @map.currentGroup().paintBackground()
      @map.nextGroup()

  startGameHandler: ->
    @controls.on 'click', '.start_game', =>
      @controls.find('.next_group').hide()

$ ->
  window.main = new Main()
