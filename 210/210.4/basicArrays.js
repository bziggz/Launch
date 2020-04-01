// 1

function firstElementOf(arr) {
  if (arr.length > 0) return arr[0];
}

firstElementOf(['U', 'S', 'A']); // returns "U"

// 2

function lastElementOf(arr) {
  if (arr.length > 0) return arr[arr.length - 1];
}

lastElementOf(['U', 'S', 'A']); // returns "A"

// 3

function nthElementOf(arr, index) {
  return arr[index];
}

let digits = [4, 8, 15, 16, 23, 42];

console.log(nthElementOf(digits, 3)); // returns 16
console.log(nthElementOf(digits, 8)); // what does this return?
console.log(nthElementOf(digits, -1)); // what does this return?

// 4

digits[-1] = -42;
console.log(nthElementOf(digits, -1));
console.log(digits[-1]);
console.log(digits['-1']); // Note that we are using a string here

// 5

function firstNOf(arr, count) {
  return arr.slice(0, count);
}

digits = [4, 8, 15, 16, 23, 42];

console.log(firstNOf(digits, 3)); // returns [4, 8, 15]

// 6

function lastNOf(arr, count) {
  return arr.slice(count);
}

digits = [4, 8, 15, 16, 23, 42];
console.log(lastNOf(digits, 10)); // returns [16, 23, 42]

// 7

function lastNOf2(arr, count) {
  if (count > arr.length - 1) return arr;
  return arr.slice(count);
}

digits = [4, 8, 15, 16, 23, 42];
console.log(lastNOf2(digits, 10)); // returns [4, 8, 15, 16, 23, 42]

// 8

function endsOf(beginningArr, endingArr) {
  return [beginningArr[0], endingArr[endingArr.length - 1]];
}

console.log(endsOf([4, 8, 15], [16, 23, 42])); // returns [4, 42]
