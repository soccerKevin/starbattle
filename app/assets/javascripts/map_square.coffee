class MapSquare
  constructor: (elem)->
    @element = $(elem)
    @state = null
    @handlers()

  handlers: ->
    @clickHandler()

  clickHandler: ->
    @element.on 'click', =>
      @trigger 'click'
      false

  group: ->
    group = parseInt @element.attr 'data-group_index'
    if isNaN group then null else group

  trigger: (eventName, data=@)->
    @element.trigger "MapSquare.#{eventName}", data

  toJSON: ->
    state: @state
    group_index: @group()

window.MapSquare = MapSquare
