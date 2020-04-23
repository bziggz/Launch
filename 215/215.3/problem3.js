// B:O   X:K   D:Q   C:P   N:A
// G:T   R:E   F:S   J:W   H:U
// V:I   L:Y   Z:M

// This limits the words you can spell with the blocks to only those words 
// that do not use both letters from any given block. You can also only use each block once.

// Write a function that takes a word string as an argument, and returns true 
// if the word can be spelled using the set of blocks, or false otherwise. 
//   You can consider the letters to be case-insensitive when you apply the rules.

// INPUT - a word string
// OUTPUT - boolean if word can be spelled with letters
// RULES - block can only be used once

// ALGORITHM

// create reference string of alphabet

// iterate over downcased string: 
//   if indexOf(char) !== lastIndexof(char) return false
//   if reference.indexOf(char) + 13 % 26 is in the string return false

// return true otherwise

const reference = 'abcdefghijklmnopqrstuvwxyz';

const isBlockWord = (string) => {
  const testString = string.toLowerCase();

  for (let i = 0; i < testString.length; i += 1) {
    const char = testString[i];
    const oppositeChar = reference[(reference.indexOf(char) + 13) % 26];

    if (testString.indexOf(char) !== testString.lastIndexOf(char)
      || testString.indexOf(oppositeChar) !== -1) {
      return false;
    }
  }

  return true;
};

// TEST CASES

  // HAPPY PATHS:

console.log(isBlockWord('BATCH')); // true
console.log(isBlockWord('BUTCH')); // false
console.log(isBlockWord('jest')); // true

  // EDGE:
    // EMPTY:

console.log(isBlockWord('')); // true

    // BOUNDARY:
    // DUPLICATES:
    // CASE:
    // DATA TYPE:
    // SPECIAL VALUES:
      // NILL/NULL:
      // NaN:
      // UNDEFINED:
      // NEGATIVE NUMS:
      

  // FAILURE:
    // EXCEPTION/ERROR:
