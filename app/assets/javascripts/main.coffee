class Main
  constructor: ->
    @map = new MapCreator()
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
    .fail (xhr, status, err) =>
      alert "map error: #{err}"

  findMapFromInput: ->
    input = @mapIndexFromInput()
    if isNaN parseInt input
      MapService.findName input
    else
      MapService.findIndex input

  mapIndexFromInput: ->
    @controls.find('.map_index').val()

  replaceMap: (map)->
    @map.element.siblings('.name').val map.name()
    @map.element.replaceWith map.element
    @map = map

$ ->
  window.main = new Main()
