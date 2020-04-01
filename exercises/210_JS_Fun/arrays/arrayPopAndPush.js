const pop = (arr) => {
  if (arr.length === 0) return undefined;
  const result = arr[arr.length - 1];
  arr.length -= 1;
  return result;
};

// pop
let array = [1, 2, 3];
console.log(pop(array)); // 3
console.log(array); // [1, 2]
console.log(pop([])); // undefined
console.log(pop([1, 2, ['a', 'b', 'c']])); // ["a", "b", "c"]

const push = (arr, ...values) => {
  for (let i = 0; i < values.length; i += 1) arr[arr.length] = values[i];
  return arr.length;
};

// push
array = [1, 2, 3];
console.log(push(array, 4, 5, 6)); // 6
console.log(array); // [1, 2, 3, 4, 5, 6]
console.log(push([1, 2], ['a', 'b'])); // 3
console.log(push([], 1)); // 1
console.log(push([])); // 0
