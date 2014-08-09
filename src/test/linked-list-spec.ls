List = require '../index'
require! chai.assert

assertList = (list, other) ->
  idx = 0
  n = other.length
  iter = list.head!
  while not list.is-end iter
    assert.equal iter.value, other[idx++]
    iter .= next
  assert.equal idx, n

describe 'LinkedList' ->
  specify 'create from list' ->
    x = [1,2,3]
    list = List x
    assertList list, x

  specify 'remove head' ->
    x = [1,2,3]
    list = List x
    assert.equal list.head!remove!.value, 1
    assertList list, [2,3]

  specify 'remove middle' ->
    x = [1,2,3]
    list = List x
    iter = list.head!
    assert.equal iter.next.remove!.value, 2
    assertList list, [1,3]

  specify 'remove tail' ->
    x = [1,2,3]
    list = List x
    assert.equal list.tail!remove!.value, 3
    assertList list, [1,2]

  specify 'append middle' ->
    x = [1,2,3]
    list = List x
    list.head!next.appendValue 4
    assertList list, [1,2,4,3]

  specify 'prepend middle' ->
    x = [1,2,3]
    list = List x
    list.head!next.prependValue 4
    assertList list, [1,4,2,3]

  specify 'prepend head' ->
    x = [1,2,3]
    list = List x
    list.head!prependValue 4
    assertList list, [4,1,2,3]

  specify 'append head' ->
    x = [1,2,3]
    list = List x
    list.head!appendValue 4
    assertList list, [1,4,2,3]

  specify 'append tail' ->
    x = [1,2,3]
    list = List x
    list.tail!appendValue 4
    assertList list, [1,2,3,4]

  specify 'prepend tail' ->
    x = [1,2,3]
    list = List x
    list.tail!prependValue 4
    assertList list, [1,2,4,3]

