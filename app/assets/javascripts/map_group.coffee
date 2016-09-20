class MapGroup
  constructor: ->
    @squares = []

  addSquare: (square)->
    @squares.push square

window.MapGroup = MapGroup
