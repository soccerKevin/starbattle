class MapCreator extends Map
  constructor: (map_selector='.map')->
    super map_selector
    @board = new Board()
    @controls = $('.controls')
    @currentGroupIndex = 0
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
      square.setGroup @currentGroupIndex
      square.setColor @groupColors[@currentGroupIndex]

  nextGroupHandler: ->
    @controls.on 'click', '.next_group', =>
      return if @currentGroup(true).is_empty()
      @currentGroupIndex += 1
      @groupColors.push new Color()

  currentGroup: (resetGroups=false)->
    @board.groups(resetGroups)[@currentGroupIndex]

window.MapCreator = MapCreator
