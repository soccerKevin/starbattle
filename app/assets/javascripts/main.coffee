class Main
  constructor: ->
    @map = new Map()
    @controls = $('.controls')
    @handlers()

  handlers: ->
    @nextGroupHandler()

  nextGroupHandler: ->
    @controls.find('.next_group').on 'click', =>
      @map.currentGroup().paintBackground()
      @map.nextGroup()

$ ->
  window.main = new Main()
