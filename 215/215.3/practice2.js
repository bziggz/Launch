// The formula verifies a number against its included check digit, 
// which is usually appended to a partial number to generate the full number. 
// This number must pass the following test:

// Counting from the rightmost digit and moving left, double the value of every second digit
// For any digit that thus become 10 or more, subtract 9 from the result
// 1111 becomes 2121
// 8763 becomes 7733 (from 2 x 6 = 12 -> 12 - 9 = 3 and 2 x 8 = 16 -> 16 - 9 = 7)
// Add all these digits together
// 1111 becomes 2121 sums as 2 + 1 + 2 + 1 to give a checksum of 6
// 8763 becomes 7733, and 7 + 7 + 3 + 3 is 20
// If the total (the checksum) ends in 0 (put another way, if the total modulus 10 is 
//   congruent to 0), then the number is valid according to the Luhn Formula; 
// else it is not valid. Thus, 1111 is not valid (as shown above, it comes out to 6),
//  while 8763 is valid (as shown above, it comes out to 20).

// Write a program that, given a number in string format, check if it is valid per 
// the Luhn formula. This should treat, for example, "2323 2005 7766 3554" as valid. 
// You can ignore all non-numeric characters in the input string.

// ALGORITHM:

// clean string and split in to array
// map array in to numbers
// reverse array and map odd indices to element * 2, if >= 10 % 9
// reduce array to sum
// return sum % 10 === 0

const luhnValidated = (string) => {
  if (!string) return false;

  const digits = string.replace(/\D/g, '').split('').map(Number).reverse();

  const sum = digits.map((num, idx) => (idx % 2 === 1 ? num * 2 : num))
    .map((num) => (num >= 10 ? num - 9 : num))
    .reduce((total, num) => total + num, 0);

  return sum % 10 === 0;
};


  // HAPPY PATHS:

console.log(luhnValidated('8763')); // true
console.log(luhnValidated('2323 2005 7766 3554')); // true
console.log(luhnValidated('1111')); // false

  // EDGE:
    // EMPTY:

console.log(luhnValidated('')); // false

    // BOUNDARY:
    // DUPLICATES:
    // CASE:
    // DATA TYPE:

console.log(luhnValidated('2323 2005 7766 3bashwrt,/;,GAFG554')); // true
console.log(luhnValidated('         2323 2005 7766       3554')); // true

  // FAILURE:
    // EXCEPTION/ERROR:
    // SPECIAL VALUES:

