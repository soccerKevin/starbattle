class MapCreator extends Map
  constructor: (map_selector='.map')->
    super map_selector
    @create()

  create: ->
    @board = new Board()
    @controls = $('.map_controls .create_controls').show()
    @currentGroupIndex = 0
    @groupColors = [new Color()]
    @handlers()

  handlers: ->
    @squareClickHandler()
    @nextGroupHandler()
    @saveHandler()
    @changeSizeHandler()

  saveHandler: ->
    @controls.off 'click', '.save_map'
    @controls.on 'click', '.save_map', =>
      MapService.save @

  squareClickHandler: ->
    @element.off "SquareCreator.click"
    @element.on "SquareCreator.click", (event, square)=>
      square.setGroup @currentGroupIndex
      square.setColor @groupColors[@currentGroupIndex]

  nextGroupHandler: ->
    @controls.off 'click', '.next_group'
    @controls.on 'click', '.next_group', =>
      return true if @currentGroup(true).is_empty()
      @currentGroupIndex += 1
      @groupColors.push new Color()

  changeSizeHandler: ->
    @controls.find('.change_size input').off 'click'
    @controls.find('.change_size input').on 'click', =>
      false

    @controls.find('.change_size input').on 'keyup', (event)=>
      @replaceMap @changeSizeInput() if event.keyCode == 13

    @controls.off 'click', '.change_size'
    @controls.on 'click', '.change_size', =>
      @replaceMap @changeSizeInput()

  changeSizeInput: ->
    parseInt @controls.find('.change_size input').val()

  replaceMap: (size)->
    MapService.newMap(size)
    .done (map) =>
      newElement = $(map.map)
      @element.replaceWith newElement
      @element = newElement
      @create()

  currentGroup: (resetGroups=false)->
    @board.groups(resetGroups)[@currentGroupIndex]

window.MapCreator = MapCreator
