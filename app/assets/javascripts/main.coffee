class Main
  constructor: ->
    @map = new Map '.map'
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
      MapService.save @map

  findGameHandler: ->
    @controls.on 'click', '.find_map', =>
      @findAndReplaceMapFromInput()

    @controls.on 'keyup', '.map_index', (e)=>
      @findAndReplaceMapFromInput() if e.keyCode == 13

  findAndReplaceMapFromInput: ->
    @findMapFromInput()
    .done (map)=>
      @replaceMap Map.createFrom map

  findMapFromInput: ->
    MapService.find(@mapIndexFromInput())

  mapIndexFromInput: ->
    @controls.find('.map_index').val()

  replaceMap: (map)->
    console.log @map.element
    console.log map.element
    @map.element.replaceWith map.element.clone()

$ ->
  window.main = new Main()
