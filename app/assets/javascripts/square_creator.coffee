class SquareCreator
  constructor: (elem)->
    @element = $(elem)
    @handlers()

  handlers: ->
    @clickHandler()

  clickHandler: ->
    @element.on 'click', =>
      @trigger 'click'
      false

  setGroup: (index)->
    @element.attr 'data-group_index', index

  setColor: (color)->
    @element.css 'background': "rgba(#{color.rgbaString()})"
    @element.attr 'color', color.rgbaString()

  trigger: (eventName, data=@)->
    @element.trigger "SquareCreator.#{eventName}", data

window.SquareCreator = SquareCreator
