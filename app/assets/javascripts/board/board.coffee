#a collection of squares.  get squares in any form you want
class Board
  constructor: (element='.map')->
    @element = $ element
    @config()
    @squares()

  config: ->
    @squareSelector = '.map_square'

  squares: (reset=false)->
    @unsetSquares() if reset
    @squaresCache ||= @element.find(@squareSelector).get().map (elem)->
      new SquareCreator elem

  unsetSquares: ->
    @squaresCache = null

  groups: (reset=false)->
    @unsetGroups() if reset
    @groupsCache ||= @groupSquares()

  groupSquares: ->
    groupedSquares = @squares().group (square)->
      square.group()
    delete groupedSquares['null']
    Object.values(groupedSquares).map (squares)->
      new Group squares

  unsetGroups: ->
    @groupsCache = null

window.Board = Board


