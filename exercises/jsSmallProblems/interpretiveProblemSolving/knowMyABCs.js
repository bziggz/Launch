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