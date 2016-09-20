class Map
  constructor: ->
    @element = $('.map')
    @groups = [new MapGroup()]
    @currentGroupIndex = 0
    @createSquares()
    @handlers()

  currentGroup: ->
    @groups[@currentGroupIndex]

  createSquares: ->
    @squares = []
    @element.find('.map_square').each (index, elem)=>
      @squares.push new MapSquare elem

  nextGroup: ->
    @currentGroupIndex += 1
    @createGroup() if !@groups[@currentGroupIndex]

  createGroup: ->
    @groups.push @currentGroupIndex

  addToCurrentGroup: (square)->
    @currentGroup().addSquare square

  handlers: ->
    @clickHandler()

  clickHandler: ->
    @element.on "MapSquare.click", (event, square)=>
      @addToCurrentGroup square

window.Map = Map
