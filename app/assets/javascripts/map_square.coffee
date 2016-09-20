class MapSquare
  constructor: (elem)->
    @element = $(elem)
    @handlers()

  handlers: ->
    @clickHandler()

  clickHandler: ->
    @element.on 'click', =>
      @trigger 'click'
      false

  setColor: (r, g, b, a)->
    @color = [r, g, b, a]
    @element.css 'background': "rgba(#{r}, #{g}, #{b}, #{a})"

  trigger: (eventName, data=@)->
    @element.trigger "MapSquare.#{eventName}", data

window.MapSquare = MapSquare
