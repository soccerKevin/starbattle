Array::groupBy = (attr)->
  groups = @map((element)-> eval("element.#{attr}")).uniq()
  result = []
  for group in groups
    result.push @filter (element) => eval("element.#{attr}") == group
  result

Array::uniq = ->
  uniq = []
  @forEach (element)=>
    uniq.push element unless uniq.includes element
  uniq

Array::includes = (element)->
  @indexOf(element) > -1

Array::first = (count = 1)->
  return @ if count < 1
  selection = @slice(0, count)
  if selection.length < 2 then selection[0] else selection

Array::last = (count = 1)->
  return @ if count < 1
  selection = @slice(@length - count, @length)
  if selection.length < 2 then selection[0] else selection
