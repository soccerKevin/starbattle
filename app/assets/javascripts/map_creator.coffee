class MapCreator extends Map
  constructor: (map_selector='.map')->
    super map_selector
    @board = new Board()
    @controls = $('.controls')
    @currentGroup = 0
    @groupColors = [new Color()]
    @handlers()

  handlers: ->
    @squareClickHandler()
    @nextGroupHandler()
    @saveHandler()

  saveHandler: ->
    @controls.on 'click', '.save_map', =>
      MapService.save @

  squareClickHandler: ->
    @element.on "SquareCreator.click", (event, square)=>
      square.setGroup @currentGroup
      square.setColor @groupColors[@currentGroup]

  nextGroupHandler: ->
    @controls.on 'click', '.next_group', =>
      @currentGroup += 1
      @groupColors.push new Color()

window.MapCreator = MapCreator
