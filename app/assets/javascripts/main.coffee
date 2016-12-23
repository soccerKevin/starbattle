class Main
  constructor: ->
    @mapCreator = new MapCreator '.map'
    @controls = $('.controls')
    @handlers()

  startGame: ->
    @controls.find('.next_group').hide()

  handlers: ->
    @startGameHandler()
    @findGameHandler()

  startGameHandler: ->
    @controls.on 'click', '.start_game', =>
      @startGame()

  findGameHandler: ->
    @controls.on 'click', '.find_map', =>
      @findAndReplaceMapFromInput()

    @controls.on 'keyup', '.map_index', (e)=>
      @findAndReplaceMapFromInput() if e.keyCode == 13

  findAndReplaceMapFromInput: ->
    @findMapFromInput()
    .done (map)=>
      @replaceMap Map.createFrom map
    .fail (err) =>
      alert "failed to load map"

  findMapFromInput: ->
    MapService.find(@mapIndexFromInput())

  mapIndexFromInput: ->
    @controls.find('.map_index').val()

  replaceMap: (map)->
    @map.element.replaceWith map.element
    @map = map

$ ->
  window.main = new Main()
