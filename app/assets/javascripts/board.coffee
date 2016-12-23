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
    unsetGroups if reset
    @groups ||= @squares().group (square)->
      square.group()

  unsetGroups: ->
    @groups = null


window.Board = Board
