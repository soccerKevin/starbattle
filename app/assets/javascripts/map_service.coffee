class MapService
  @find: (index)->
    $.get "/map/#{index}"

  @save: (map)->
    mapJSON = { map: map.toJSON() }
    $.post '/map', mapJSON, (success)=>
      alert "map saved"

window.MapService = MapService
