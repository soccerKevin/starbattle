#= require jquery
#= require jquery_ujs
#= require turbolinks
#= require_tree .

window.exists = (thing)->
  (thing != undefined && thing != null && !isNaN(thing))
