class Map
  constructor: (map_selector)->
    @element = $ map_selector
    @board = new Board()
    @parentHandlers()

  @createFrom: (mapJSON)->
    $('body').append $("<div class='map_creator'></div>")
    $creator = $('.map_creator')
    $element = $("<div class='map'></div>")
    $creator.append $element
    for square in mapJSON.squares
      $element.append $("<div class='map_square' data-group_index='#{square.group_index}'></div>")

    map = new Map '.map_creator .map'
    map.groupSquares()
    map.paintGroups()
    $creator.detach()
    map

  toJSON: ->
    name: @name()
    width: Math.floor Math.sqrt @squares.length
    squares_attributes: @squares.map (square) ->
      square.toJSON()

  name: (fetch=false)->
    unsetName if fetch
    @nameCache ||= @element.siblings('.name').val()

  unsetName: ->
    @nameCache = null

  paintGroups: ->
    @groups.forEach (group)=>
      group.paintBackground()

  parentHandlers: ->
    @saveNameHandler()

  saveNameHandler: ->
    @element.siblings('.name').on 'keyup', ->
      @name true


window.Map = Map
