// 1

function oddElementsOf(arr) {
  const result = [];

  for (let i = 0; i < arr.length; i += 1) {
    if (i % 2 === 1) result.push(arr[i]);
  }

  return result;
}

let digits = [4, 8, 15, 16, 23, 42];

console.log(oddElementsOf(digits)); // returns [8, 16, 42]

// 2

function combinedArray(even, odd) {
  const result = [];

  for (let i = 0; i < even.length; i += 1) {
    result.push(even[i]);
    result.push(odd[i]);
  }

  return result;
}

digits = [4, 8, 15, 16, 23, 42];
let letters = ['A', 'L', 'V', 'A', 'R', 'H'];

console.log(combinedArray(digits, letters));
// returns [4, "A", 8, "L", 15, "V", 16, "A", 23, "R", 42, "H"]

// 3

function arrReversedArr(arr) {
  const result = arr;

  for (let i = arr.length - 1; i >= 0; i -= 1) result.push(arr[i]);

  return result;
}

digits = [4, 8, 15, 16, 23, 42];
console.log(arrReversedArr(digits));

// 4

function sortDescending(arr) {
  const result = arr.slice();
  return result.sort((a, b) => b - a);
}

const array = [23, 4, 16, 42, 8, 15];
const sortedArr = sortDescending(array); // returns [42, 23, 16, 15, 8, 4]
console.log(sortedArr); // logs    [42, 23, 16, 15, 8, 4]
console.log(array); // logs    [23, 4, 16, 42, 8, 15]

// 5

function matrixSums(arr) {
  const result = [];

  for (let i = 0; i < arr.length; i += 1) {
    result.push(arr[i].reduce((accum, el) => accum + el));
  }

  return result;
}

console.log(matrixSums([[2, 8, 5], [12, 48, 0], [12]])); // returns [15, 60, 12]

// 6

function uniqueElements(arr) {
  const result = [];

  for (let i = 0; i < arr.length; i += 1) {
    if (!result.includes(arr[i])) result.push(arr[i]);
  }

  return result;
}

console.log(uniqueElements([1, 2, 4, 3, 4, 1, 5, 4]));
// returns [1, 2, 4, 3, 5]
