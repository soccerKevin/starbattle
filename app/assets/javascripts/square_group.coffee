class SquareGroup
  constructor: (@squares =[])->
    @options = { background: new Color() }

  # applyOptions: ->
  #   @paintBackground() if @options.background

  paintBackground: ->
    [r, g, b, a] = @options.background.toArray()
    for square in @squares
      square.setColor r, g, b, a

  addSquare: (square)->
    [r, g, b, a] = @options.background.toArray()
    square.setColor r, g, b, a
    @squares.push square

window.SquareGroup = SquareGroup
