class Map
  constructor: (map_selector, name='')->
    @element = $ map_selector
    @setName name
    @board = new Board map_selector
    @parentHandlers()

  @createFrom: (mapJSON)->
    $('body').append $("<div class='map_creator'></div>")
    $creator = $('.map_creator')
    $element = $("<div class='map'></div>")
    $creator.append $element
    for squareJSON in mapJSON.squares
      $element.append MapSquare.HTMLfromJSON squareJSON

    map = new Map '.map_creator .map', mapJSON.name
    map.paintGroups()
    $creator.detach()
    map

  toJSON: ->
    name: @name()
    width: @width()
    squares_attributes: @board.squares().map (square) ->
      square.toJSON()

  setName: (name)->
    @nameCache = name

  name: (fetch=false)->
    @unsetName() if fetch
    @nameCache ||= @element.siblings('.name').val()

  width: ->
    Math.floor Math.sqrt @board.squares().length

  unsetName: ->
    @nameCache = null

  paintGroups: ->
    for group in @board.groups()
      group.paintBackground()

  parentHandlers: ->
    @saveNameHandler()

  saveNameHandler: ->
    @element.siblings('.name').on 'keyup', ->
      @unsetName()

    @element.siblings('.name').on 'blur', ->
      @name true

  hide: ->
    @controls.hide()


window.Map = Map
