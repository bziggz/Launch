// mplement encoding and decoding for the rail fence cipher.

// The Rail Fence cipher is a form of transposition cipher that gets its name from the way in which it's encoded. It was already used by the ancient Greeks.

// In the Rail Fence cipher, the message is written downwards on successive "rails" of an imaginary fence, then moving up when we get to the bottom (like a zig-zag). Finally the message is then read off in rows.

// For example, using three "rails" and the message "WE ARE DISCOVERED FLEE AT ONCE", the cipherer writes out:

// W . . . E . . . C . . . R . . . L . . . T . . . E
// . E . R . D . S . O . E . E . F . E . A . O . C .
// . . A . . . I . . . V . . . D . . . E . . . N . .
// Then reads off:

// WECRLTEERDSOEEFEAOCAIVDEN
// To decrypt a message you take the zig-zag shape and fill the ciphertext along the rows.

// ? . . . ? . . . ? . . . ? . . . ? . . . ? . . . ?
// . ? . ? . ? . ? . ? . ? . ? . ? . ? . ? . ? . ? .
// . . ? . . . ? . . . ? . . . ? . . . ? . . . ? . .
// The first row has seven spots that can be filled with "WECRLTE".

// W . . . E . . . C . . . R . . . L . . . T . . . E
// . ? . ? . ? . ? . ? . ? . ? . ? . ? . ? . ? . ? .
// . . ? . . . ? . . . ? . . . ? . . . ? . . . ? . .
// Now the 2nd row takes "ERDSOEEFEAOC".

// W . . . E . . . C . . . R . . . L . . . T . . . E
// . E . R . D . S . O . E . E . F . E . A . O . C .
// . . ? . . . ? . . . ? . . . ? . . . ? . . . ? . .
// Leaving "AIVDEN" for the last row.

// W . . . E . . . C . . . R . . . L . . . T . . . E
// . E . R . D . S . O . E . E . F . E . A . O . C .
// . . A . . . I . . . V . . . D . . . E . . . N . .
// If you now read along the zig-zag shape you can read the original message.

// INPUT - an unencrptyed string
// OUPUT - an encrypted string

// ALGORITHM: 

// trim spaces from string
// create a nested array of [] * numRails
// iterate through string
//   count down rails
//     if correct rail push char
//       else push '.'
//   count up rails
//     if correct rail push char
//       else push '.'
//   flatten the array, join, remove '.'

const trimArrays = (array, char) => {
  const arrayLength = Math.max(...array.map((subArray) => subArray.lastIndexOf(char)));

  array.forEach((subArray) => subArray.length = arrayLength + 1);

  return array;
};

const railsEncrypt = (string, numRails) => {
  const trimmed = string.replace(/ /g, '').split('');
  let railsArray = [...new Array(numRails)].map(() => []);
  let count = 0;

  do {
    do {
      for (let j = 0; j < railsArray.length; j += 1) {
        railsArray[j].push(j === count ? trimmed.shift() : '.');
      }

      count += 1;
    } while (count < railsArray.length - 1);

    do {
      for (let j = 0; j < railsArray.length; j += 1) {
        railsArray[j].push(j === count ? trimmed.shift() : '.');
      }

      count -= 1;
    } while (count > 0);
  } while (trimmed.length > 0);

  trimArrays(railsArray, string[string.length - 1]);

  return railsArray.flat().filter((char) => char !== '.').join('');
};

// INPUT = an encrypted message
// OUTPUT - an unencrypted message

// ALGORITHM

// create a nested railsArray of numRails length
// split string to array
// create a decode string of string.length '?'
// encrypt the decode string into the rails array
// go through each rail in the decode array
//   while rail includes a '?'
//   substite '?' with string[rail.indexOf('?')]
// console.log all rails.join(' ')

const railsDecrypt = (string, numRails) => {
  const stringArray = [...string];
  const decodeString = '?'.repeat(string.length).split('');
  let railsArray = [...new Array(numRails)].map(() => []);
  let count = 0;

  do {
    do {
      for (let j = 0; j < railsArray.length; j += 1) {
        railsArray[j].push(j === count ? decodeString.shift() : '.');
      }

      count += 1;
    } while (count < railsArray.length - 1);

    do {
      for (let j = 0; j < railsArray.length; j += 1) {
        railsArray[j].push(j === count ? decodeString.shift() : '.');
      }

      count -= 1;
    } while (count > 0);
  } while (decodeString.length > 0);

  trimArrays(railsArray, '?');

  for (let railNum = 0; railNum < railsArray.length; railNum += 1) {
    const rail = railsArray[railNum];

    do {
      const idx = rail.indexOf('?');
      rail[idx] = stringArray.shift()
    } while (railsArray[railNum].includes('?'));

    console.log(rail.join(' '));
  }
};

console.log(railsEncrypt('GOOD NEWS EVERYONE', 3));
console.log(railsDecrypt('GNEYODESVROEOWEN', 3));

// GNEYODESVROEOWEN

// G . . . N . . . E . . . Y . . .
// . O . D . E . S . V . R . O . E
// . . O . . . W . . . E . . . N .

console.log(railsEncrypt('SIX SEASONS AND A MOVIE', 4));
console.log(railsDecrypt('SSDEIAONAIXENAMVSSO', 4));

// SSDEIAONAIXENAMVSSO

// S . . . . . S . . . . . D . . . . . E
// . I . . . A . O . . . N . A . . . I .
// . . X . E . . . N . A . . . M . V . .
// . . . S . . . . . S . . . . . O . . .

console.log(railsEncrypt('I HAVE ASKED YOU THRICE FOR A TOWEL', 5));
console.log(railsDecrypt('IEIOHKDRCTWASYHEAEVAOTFRLEUO', 5));

// IEIOHKDRCTWASYHEAEVAOTFRLEUO

// I . . . . . . . E . . . . . . . I . . . . . . . O . . .
// . H . . . . . K . D . . . . . R . C . . . . . T . W . .
// . . A . . . S . . . Y . . . H . . . E . . . A . . . E .
// . . . V . A . . . . . O . T . . . . . F . R . . . . . L
// . . . . E . . . . . . . U . . . . . . . O . . . . . . .
