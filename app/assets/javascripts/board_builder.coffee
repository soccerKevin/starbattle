class BoardBuilder extends Board
  constructor: (element, squares)->
    super element, squares
    @groups = [new SquareGroup()]
    @currentGroupIndex = 0

  # class self
  @fromDOM: (selector)->
    $element = $(selector)
    new BoardBuilder $element, $element.find('.map_square').get().map (elem)->
      new MapSquare elem

  currentGroup: ->
    current = @groups[@currentGroupIndex]
    if current then current else @groups[@currentGroupIndex] = new SquareGroup()

  nextGroup: ->
    @currentGroupIndex += 1

  addToCurrentGroup: (square)->
    square.setGroup @currentGroupIndex
    @currentGroup().addSquare square

  groupSquares: ->
    newGroups = @squares.groupBy (square) ->
      square.group()
    @groups = newGroups.map (group) ->
      new MapGroup group

window.BoardBuilder = BoardBuilder
