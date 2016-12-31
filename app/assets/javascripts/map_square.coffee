class MapSquare
  constructor: (elem)->
    @element = $(elem)
    @parentHandlers()

  parentHandlers: ->
    @clickHandler()

  clickHandler: ->
    @element.on 'click', =>
      @trigger 'click'
      false

  group: ->
    group = parseInt @element.attr 'data-group_index'
    if isNaN group then null else group

  color: ->
    Color.fromString @element.attr 'color'

  trigger: (eventName, data=@)->
    @element.trigger "MapSquare.#{eventName}", data

  paintBackground: ->
    @element.css 'background', "rgba(#{@color().rgbaString()})"

  @HTMLfromJSON: (json)->
    $("<div class='map_square' data-group_index='#{json.group_index}' color='#{json.color}'></div>")

  toJSON: ->
    state: @state
    group_index: @group()
    color: @color()

window.MapSquare = MapSquare
