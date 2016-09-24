class MapSquare
  constructor: (elem)->
    @element = $(elem)
    @groupIndex = null
    @state = null
    @handlers()

  handlers: ->
    @clickHandler()

  clickHandler: ->
    @element.on 'click', =>
      @trigger 'click'
      false

  group: ->
    parseInt @element.attr('data-group_index')

  setColor: (r, g, b, a)->
    @color = [r, g, b, a]
    @element.css 'background': "rgba(#{r}, #{g}, #{b}, #{a})"

  trigger: (eventName, data=@)->
    @element.trigger "MapSquare.#{eventName}", data

  toJSON: ->
    state: @state
    group_index: @groupIndex

window.MapSquare = MapSquare
