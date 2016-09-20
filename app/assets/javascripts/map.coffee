class Map
  constructor: ->
    @element = $('.map')
    @groups = [new MapGroup()]
    @currentGroup = 0
    @createGroup()
    @createSquares()
    @handlers()

  createSquares: ->
    @squares = []
    @element.find('.map_square').each (index, elem)=>
      @squares.push new MapSquare elem

  nextGroup: ->
    @currentGroup += 1
    @createGroup() if !@groups[@currentGroup]

  createGroup: ->
    @groups.push @currentGroup

  addToCurrentGroup: (square)->
    @currentGroup.addSquare square

  handlers: ->
    @clickHandler()

  clickHandler: ->
    @element.on "MapSquare.click", (event, square)=>
      @addToCurrentGroup square

window.Map = Map
