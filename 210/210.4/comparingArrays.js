const arraysEqual = (arr1, arr2) => {
  if (arr1.length !== arr2.length) return false;

  for (let i = 0; i < arr1.length; i += 1) {
    if (arr1[i] !== arr2[i]) return false;
  }

  return true;
};

console.log(arraysEqual([1], [1])); // true
console.log(arraysEqual([1], [2])); // false
console.log(arraysEqual([1, 2], [1, 2, 3])); // false
console.log(arraysEqual([1, 'hi', true], [1, 'hi', true])); // true
console.log(arraysEqual([1, 'hi', true], [1, 'hi', false])); // false
console.log(arraysEqual([1, 'hi', true], [1, 'hello', true])); // false
console.log(arraysEqual([1, 'hi', true], [2, 'hi', true])); // false
