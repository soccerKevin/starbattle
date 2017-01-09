class MapSolver extends Map
  constructor: (map_selector='.map')->
    super map_selector
    @controls = $('.map_controls .solve_controls').show()
    @handlers()

  handlers: ->
    @findGameHandler()

  findGameHandler: ->
    @controls.off 'click', '.find_map'
    @controls.on 'click', '.find_map', =>
      @findAndReplaceMapFromInput()

    @controls.off 'keyup', '.map_index'
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
    @element.siblings('.name').val map.name()
    @element.replaceWith map.element
    @element = map.element

window.MapSolver = MapSolver
