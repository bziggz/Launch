const shift = (array) => {
  if (array.length === 0) return undefined;

  const result = array[0];

  for (let i = 0; i < array.length; i += 1) {
    array[i] = array[i + 1];
  }

  array.length -= 1;

  return result;
};


console.log(shift([1, 2, 3])); // 1
console.log(shift([])); // undefined
console.log(shift([[1, 2, 3], 4, 5])); // [1, 2, 3]

const unshift = (array, ...values) => {
  for (let i = 0; i < values.length; i += 1) {
    for (let j = array.length; j > 0; j -= 1) {
      array[j] = array[j - 1];
    }

    array[0] = values[i];
  }

  return array.length;
};

console.log(unshift([1, 2, 3], 5, 6)); // 5
console.log(unshift([1, 2, 3])); // 3
console.log(unshift([4, 5], [1, 2, 3])); // 3

const testArray = [1, 2, 3];
console.log(shift(testArray)); // 1
console.log(testArray); // [2, 3]
console.log(unshift(testArray, 5)); // 3
console.log(testArray); // [5, 2, 3]
