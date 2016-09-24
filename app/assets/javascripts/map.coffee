class Map
  constructor: (map_selector)->
    @element = $ map_selector
    @groups = [new MapGroup()]
    @currentGroupIndex = 0
    @createSquares()
    @handlers()

  currentGroup: ->
    @groups[@currentGroupIndex]

  createSquares: ->
    @squares = []
    @element.find('.map_square').each (index, elem)=>
      @squares.push new MapSquare elem

  nextGroup: ->
    @currentGroupIndex += 1
    @createGroup() if @groups[@currentGroupIndex] == undefined

  createGroup: ->
    @groups.push new MapGroup()

  addToCurrentGroup: (square)->
    square.groupIndex = @currentGroupIndex
    @currentGroup().addSquare square

  handlers: ->
    @clickHandler()

  clickHandler: ->
    @element.on "MapSquare.click", (event, square)=>
      @addToCurrentGroup square

  toJSON: ->
    width: Math.floor Math.sqrt @squares.length
    squares_attributes: @squares.map (square) -> square.toJSON()

  regroupSquares: ->
    @groups = []
    newGroups = @squares.groupBy 'group()'
    for group in newGroups
      g = new MapGroup group
      g.paintBackground()
      @groups.push g

  @createFrom: (mapJSON)->
    $('body').append $("<div class='map_creator'></div>")
    $creator = $('.map_creator')
    $element = $("<div class='map'></div>")
    $creator.append $element
    for square in mapJSON.squares
      $element.append $("<div class='map_square' data-group_index='#{square.group_index}'></div>")

    map = new Map '.map_creator .map'
    map.regroupSquares()
    $creator.detach()
    map




window.Map = Map
