class Main
  constructor: ->
    @showNewMap()
    @gameControls = new GameControls()
    @handlers()

  handlers: ->
    @newMapHandler()
    @solveMapHandler()

  newMapHandler: ->
    @gameControls.element.on 'GameControls.newMap', =>
      @hideMaps()
      @showNewMap()

  solveMapHandler: ->
    @gameControls.element.on 'GameControls.solveMap', =>
      @hideMaps()
      @showSolveMap()

  hideMaps: ->
    @map.hide()

  showNewMap: ->
    @map = new MapCreator()

  showSolveMap: ->
    @map = new MapSolver()

$ ->
  window.main = new Main()
