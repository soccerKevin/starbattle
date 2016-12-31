class MapService
  @findIndex: (index)->
    $.get "/map/#{index}"

  @findName: (name)->
    $.get "/map?name=#{name}"

  @save: (map)->
    mapJSON = { map: map.toJSON() }
    $.post('/map', mapJSON)
    .done( (map)=>
      alert "map saved"
    ).fail (xhr, status, error)=>
      console.log "Map save error: ", error

window.MapService = MapService
