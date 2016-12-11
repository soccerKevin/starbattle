class MapCreator extends Map
  constructor: (map_selector)->
    super map_selector
    @board = BoardBuilder.fromDOM '.map'
    @handlers()

  handlers: ->
    @squareClickHandler()

  squareClickHandler: ->
    @element.on "MapSquare.click", (event, square)=>
      @board.addToCurrentGroup square

window.MapCreator = MapCreator
