class MapService
  @findIndex: (index)->
    $.get "/map/#{index}"

  @findName: (name)->
    $.get "/map?name=#{name}"

  @save: (map)->
    mapJSON = { map: map.toJSON() }
    $.post('/map', mapJSON)
    .done( (map)=>
      alert "saved map: #{map.name}"
    ).fail (xhr, status, error)=>
      alert "Map save error: ", error

window.MapService = MapService
