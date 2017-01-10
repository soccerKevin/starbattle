#= require board/board
#= require board/group
#= require board/map_square
#= require map/map
#= require map/map_solver

fixture.preload 'maps/easy1.html'
fixture.preload 'maps/easy3.html'

describe 'map solver', ->
  beforeAll ->
    $('head').append $('<link rel="stylesheet" type="text/css" href="/assets/application.css"></link>')
    $('head').append $("""
      <style>
        .map_container{ margin-left: 50px; }
      </style>
    """)

  beforeEach ->
    @map = $(fixture.load("maps/easy3.html", true)).find '.container'
    @map.remove()
    $('body').append @map

  describe 'something', ->
    it 'does something', ->
      console.log "first test"
