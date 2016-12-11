#a collection of squares.  get squares in any form you want
class Board
  constructor: (element, squares)->
    @element = element
    @squares = squares

  #class self
  @default: (selector)->
    $element = $(selector)
    new Board $element, $element.find('.map_square').get().map (elem)->
      new MapSquare elem

window.Board = Board
