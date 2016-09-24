window.rand = (start, end)->
  Math.floor(start + Math.random() * end)

window.exists = (thing)->
  (thing != undefined && thing != null && !isNaN(thing))
