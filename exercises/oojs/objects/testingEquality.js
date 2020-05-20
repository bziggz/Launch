const objectsEqual = (obj1, obj2) => {
  const properties1 = Object.keys(obj1).sort();
  const properties2 = Object.keys(obj2).sort();

  if (properties1.length !== properties2.length) return false;

  for (let i = 0; i < properties1.length; i += 1) {
    if (obj1[properties1[i]] !== obj2[properties1[i]]
      || properties1[i] !== properties2[i]) return false;
  }

  return true;
};

console.log(objectsEqual({a: 'foo'}, {a: 'foo'}));                      // true
console.log(objectsEqual({a: 'foo', b: 'bar'}, {a: 'foo'}));            // false
console.log(objectsEqual({}, {}));                                      // true
console.log(objectsEqual({a: 'foo', b: undefined}, {a: 'foo', c: 1}));  // false