Array::groupBy = (func)->
  groups = @map((element)-> func(element)).compact().uniq()
  result = []
  for group in groups
    result.push @filter (element) => func(element) == group
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

Array::compact = ->
  @filter (elem)-> exists elem

Array::group = (func)->
  groups = {}
  iterator = @values()
  while element = iterator.next().value
    bucket = func element
    groups[bucket] = [] unless !!groups[bucket]
    groups[bucket].push element

  groups
