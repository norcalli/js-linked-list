// Generated by LiveScript 1.2.0
var List, assert, assertList;
List = require('../index');
assert = require('chai').assert;
assertList = function(list, other){
  var idx, n, iter;
  idx = 0;
  n = other.length;
  iter = list.head();
  while (!list.isEnd(iter)) {
    assert.equal(iter.value, other[idx++]);
    iter = iter.next;
  }
  return assert.equal(idx, n);
};
describe('LinkedList', function(){
  specify('create from list', function(){
    var x, list;
    x = [1, 2, 3];
    list = List(x);
    return assertList(list, x);
  });
  specify('remove head', function(){
    var x, list;
    x = [1, 2, 3];
    list = List(x);
    assert.equal(list.head().remove().value, 1);
    return assertList(list, [2, 3]);
  });
  specify('remove middle', function(){
    var x, list, iter;
    x = [1, 2, 3];
    list = List(x);
    iter = list.head();
    assert.equal(iter.next.remove().value, 2);
    return assertList(list, [1, 3]);
  });
  specify('remove tail', function(){
    var x, list;
    x = [1, 2, 3];
    list = List(x);
    assert.equal(list.tail().remove().value, 3);
    return assertList(list, [1, 2]);
  });
  specify('append middle', function(){
    var x, list;
    x = [1, 2, 3];
    list = List(x);
    list.head().next.appendValue(4);
    return assertList(list, [1, 2, 4, 3]);
  });
  specify('prepend middle', function(){
    var x, list;
    x = [1, 2, 3];
    list = List(x);
    list.head().next.prependValue(4);
    return assertList(list, [1, 4, 2, 3]);
  });
  specify('prepend head', function(){
    var x, list;
    x = [1, 2, 3];
    list = List(x);
    list.head().prependValue(4);
    return assertList(list, [4, 1, 2, 3]);
  });
  specify('append head', function(){
    var x, list;
    x = [1, 2, 3];
    list = List(x);
    list.head().appendValue(4);
    return assertList(list, [1, 4, 2, 3]);
  });
  specify('append tail', function(){
    var x, list;
    x = [1, 2, 3];
    list = List(x);
    list.tail().appendValue(4);
    return assertList(list, [1, 2, 3, 4]);
  });
  return specify('prepend tail', function(){
    var x, list;
    x = [1, 2, 3];
    list = List(x);
    list.tail().prependValue(4);
    return assertList(list, [1, 2, 4, 3]);
  });
});