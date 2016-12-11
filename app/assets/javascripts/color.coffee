class Color
  constructor: (@r=rand(0, 255), @g=rand(0, 255), @b=rand(0, 255), @a=1) ->

  toHash: ->
    { r: @r, g: @g, b: @b, a: @a }

  toArray: ->
    [@r, @g, @b, @a]

window.Color = Color
