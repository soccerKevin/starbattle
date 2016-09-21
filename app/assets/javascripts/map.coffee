class Map
  constructor: ->
    @element = $('.map')
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

  save: ->
    mapJSON = { map: @toJSON() }
    $.post '/map', mapJSON, (success)=> console.log "SUCCESS"

  find: (index)->
    $.get "/map/#{index}", (map)=>
      console.log map


window.Map = Map
