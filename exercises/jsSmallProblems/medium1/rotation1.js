// Write a function that rotates an array by moving the first element
// to the end of the array. Do not modify the original array.

// If the input is not an array, return undefined.
// If the input is an empty array, return an empty array.
// Review the test cases below, then implement the solution accordingly.

// INPUT - a data type
// OUTPUT -  empty array ? empty rotate
//           not an array ? undefined
//           array ?
//             array.push(array.shift)


const rotateArray = (array) => {
  if (!Array.isArray(array)) return undefined;
  if (array.length === 0) return [];
  const result = [...array];

  result.push(result.shift());

  return result;
};

console.log(rotateArray([7, 3, 5, 2, 9, 1])); // [3, 5, 2, 9, 1, 7]
console.log(rotateArray(['a', 'b', 'c'])); // ["b", "c", "a"]
console.log(rotateArray(['a'])); // ["a"]
console.log(rotateArray([1, 'a', 3, 'c'])); // ["a", 3, "c", 1]
console.log(rotateArray([{ a: 2 }, [1, 2], 3])); // [[1, 2], 3, { a: 2 }]
console.log(rotateArray([])); // []

// return `undefined` if the argument is not an array
console.log(rotateArray()); // undefined
console.log(rotateArray(1)); // undefined


// the input array is not mutated
const array = [1, 2, 3, 4];
console.log(rotateArray(array)); // [2, 3, 4, 1]
console.log(array); // [1, 2, 3, 4]
