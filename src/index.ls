node = (value) ->
  value: value
  remove: ->
    @prev.next = @next
    @next.prev = @prev
    return @

  appendValue: (other) ->
    x = node other
    x{prev, next} = @
    x.prepend @

  append: (x) ->
    @next = x
    @prev = x.prev
    @next.prev = @
    @prev.next = @
    return @

  prependValue: (other) ->
    x = node other
    x{prev, next} = @
    x.append @
    # @prepend x

  prepend: (x) ->
    @prev = x
    @next = x.next
    @prev.next = @
    @next.prev = @
    return @

list = (values) ->
  sentinel = node!
  sentinel.prev = sentinel
  sentinel.next = sentinel
  if values
    iter = sentinel
    for value in values
      iter := iter.appendValue value
  return
    head: -> sentinel.next
    tail: -> sentinel.prev
    push: -> sentinel.prependValue it
    pop: -> sentinel.prev.remove!
    is-end: -> sentinel is it

list.node = node

module.exports = list
