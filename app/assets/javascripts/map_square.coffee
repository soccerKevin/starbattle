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
    @element.attr 'color'

  trigger: (eventName, data=@)->
    @element.trigger "MapSquare.#{eventName}", data

  toJSON: ->
    state: @state
    group_index: @group()
    color: @color()

window.MapSquare = MapSquare
