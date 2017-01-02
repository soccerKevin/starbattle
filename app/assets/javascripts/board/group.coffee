class Group
  constructor: (squares)->
    @squares = squares

  is_empty: ->
    @squares.is_empty()

  paintBackground: ->
    for square in @squares
      square.paintBackground()

window.Group = Group
