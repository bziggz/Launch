// You are given a list of numbers in a "short-hand" range where only the
// significant part of the next number is written because we know the numbers
// are always increasing (ex. "1, 3, 7, 2, 4, 1" represents [1, 3, 7, 12, 14, 21]).
//  Some people use different separators for their ranges
//  (ex. "1-3, 1-2", "1:3, 1:2", "1..3, 1..2" represent the same numbers
//   [1, 2, 3, 11, 12]). Range limits are always inclusive.

// Your job is to return a list of complete numbers.

// The possible separators are: ["-", ":", ".."]

// "1, 3, 7, 2, 4, 1" --> 1, 3, 7, 12, 14, 21
// "1-3, 1-2" --> 1, 2, 3, 11, 12
// "1:5:2" --> 1, 2, 3, 4, 5, 6, ... 12
// "104-2" --> 104, 105, ... 112
// "104-02" --> 104, 105, ... 202
// "545, 64:11" --> 545, 564, 565, ... 611

// INPUT - a string list of numbers in shorthand, including inclusive ranges
// OUTPUT - an array of numbers, showing all numbers called by string
// RULES -
//   numbers are always increasing
//   ranges can have different seperators
//   ranges are inclusive

// ALGORITHM:

// split numStrings into an array of only digits and ranges
// if element is a range, convert it to digits - flatmap
//   split ranges delimiter rangeChars
//   convert digits to increasing nums
//   fill in missing numbers in ranges
// convert digits in outer array to increasing nums
// convert digits to numbers in copy array
//   if num < previousNum then

const isLessThanPrevious = (numString1, numString2) => (
  Number(numString2) <= Number(numString1)
  || Number(numString2) <= Number(numString1.slice(-numString2.length))
);

const increaseNumber = (numString, exponent) => (
  String(Number(numString) + 10 ** exponent)
);

const increaseNonRangeNumbers = (numStringArray) => {
  const result = [numStringArray[0]];

  for (let i = 1; i < numStringArray.length; i += 1) {
    if (!isLessThanPrevious(result[result.length - 1], numStringArray[i])) {
      result.push(numStringArray[i]);
    } else {
      let newNum = numStringArray[i];
      do {
        newNum = increaseNumber(newNum, numStringArray[i].length);
      } while (isLessThanPrevious(result[result.length - 1], newNum));

      result.push(newNum);
    }
  }

  return result;
};

const isRange = (string) => /\.\.|-|:/.test(string);

const splitRange = (rangeString) => {
  const rangeArray = increaseNonRangeNumbers(rangeString.split(/\.\.|-|:/));
  const trimLength = rangeArray[0].length;
  const result = [];

  for (let i = Number(rangeArray[0]);
    i <= Number(rangeArray[rangeArray.length - 1]); i += 1) {
    result.push(String(i));
  }

  return result.map((numString) => numString.slice(-trimLength));
};

const shortHandNumbers = (numString) => {
  const numStringArray = numString.split(', ');

  const unRangedArray = numStringArray
    .flatMap((element) => (isRange(element) ? splitRange(element) : element));

  return increaseNonRangeNumbers(unRangedArray).map(Number);
};

console.log(shortHandNumbers('1, 3, 7, 2, 4, 1')); // --> 1, 3, 7, 12, 14, 21
console.log(shortHandNumbers('1-3, 1-2')); // --> 1, 2, 3, 11, 12
console.log(shortHandNumbers('1:5:2')); // --> 1, 2, 3, 4, 5, 6, ... 12
console.log(shortHandNumbers('104-2')); // --> 104, 105, ... 112
console.log(shortHandNumbers('104-02')); // --> 104, 105, ... 202
console.log(shortHandNumbers('545, 64:11')); // --> 545, 564, 565, ... 611
