class MapSquare
  constructor: (elem)->
    @element = $(elem)
    @handlers()

  handlers: ->
    @clickHandler()

  clickHandler: ->
    @element.on 'click', =>
      @element.css('background', 'blue')
      @trigger 'click'
      false

  trigger: (eventName, data=@)->
    @element.trigger "MapSquare.#{eventName}", data

window.MapSquare = MapSquare
