class MapCreator extends Map
  constructor: (map_selector)->
    super map_selector
    @board = BoardBuilder.fromDOM '.map'
    @controls = $('.controls')
    @handlers()

  handlers: ->
    @squareClickHandler()
    @nextGroupHandler()

  squareClickHandler: ->
    @element.on "MapSquare.click", (event, square)=>
      @board.addToCurrentGroup square

  nextGroupHandler: ->
    @controls.on 'click', '.next_group', =>
      @board.nextGroup()

window.MapCreator = MapCreator
