class GameControls
  constructor: ->
    @element = $('.game_controls')
    @newMap = @element.find '.new_map'
    @solveMap = @element.find '.solve_map'
    @handlers()

  handlers: ->
    @newMapHandler()
    @solveMapHandler()

  newMapHandler: ->
    @newMap.on 'click', =>
      return false if @newMapIsActive()
      @resetButtons()
      @activateNewMap()
      @element.trigger 'GameControls.newMap'

  solveMapHandler: ->
    @solveMap.on 'click', =>
      return false if @solveMapIsActive()
      @resetButtons()
      @activateSolveMap()
      @element.trigger 'GameControls.solveMap'

  newMapIsActive: ->
    @newMap.hasClass 'active'

  solveMapIsActive: ->
    @solveMap.hasClass 'active'

  activateNewMap: ->
    @newMap.addClass 'active'

  activateSolveMap: ->
    @solveMap.addClass 'active'

  resetButtons: ->
    @newMap.removeClass 'active'
    @solveMap.removeClass 'active'

window.GameControls = GameControls
