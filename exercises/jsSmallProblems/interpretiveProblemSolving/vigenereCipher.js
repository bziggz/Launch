// The Vigenere Cipher encrypts alphabetic text using polyalphabetic substitution.
// It uses a series of Caesar Ciphers based on the letters of a keyword. Each letter
// of the keyword is treated as a shift value. For instance, the letter 'B' corresponds
// to a shift value of 1, and the letter 'd' corresponds to a shift value of 3. In other
// words, the shift value used for a letter is equal to its index value in the alphabet.
// This means that the letters 'a'-'z' are equivalent to the numbers 0-25. The uppercase
// letters 'A'-'Z' are also equivalent to 0-25.

// Applying the Vigenere Cipher is done sequentially for each character by
// applying the current shift value to a Caesar Cipher for that particular
// character. To make this more concrete, let's look at the following example:

// plaintext: Pineapples don't go on pizzas!
// keyword: meat

// Applying the Vigenere Cipher for each alphabetic character:
// plaintext : Pine appl esdo ntgo onpi zzas
// shift     : meat meat meat meat meat meat
// ciphertext: Bmnx mtpe qwdh zxgh arpb ldal

// result: Bmnxmtpeqw dhz'x gh ar pbldal!
// Notice that in the example, the key isn't moved forward if the character
// isn't in the alphabet. Like the Caesar Cipher, the Vigenere Cipher only encrypts
// alphabetic characters.

// Write a function that implements the Vigenere Cipher. The case of the
// keyword doesn't matter—in other words, the resulting encryption won't change
// depending on the case of the keyword's letters (e.g., 'MEat' === 'mEaT').


// input - 2 strings - text to encrypt and encryption keyword
// output - string - encrypted text, maintaining char format

// Algorith -
//   create 2 reference alpha string - upper and lower
//   create alpha-trimmed copy os string
//   create result string
//   create keyword array on string lebngth - map to index nums
//   iterate over trimmed string
//     newchar is based on keyword array

const vigenereCipher = (string, keyword) => {
  if (string.length === 0) return '';
  if (keyword.length === 0) return string;
  const lowerRef = 'abcdefghijklmnopqrstuvwxyz';
  const upperRef = lowerRef.toUpperCase();

  const charArray = [...string.replace(/[^a-z]/gi, '')];
  let keyArray = [...keyword.toLowerCase()].map((char) => lowerRef.indexOf(char));

  do {
    keyArray = keyArray.concat(keyArray);
  } while (keyArray.length < charArray.length);

  let result = '';

  const newCharArray = charArray.map((char, idx) => {
    if (/[a-z]/.test(char)) {
      return lowerRef[(lowerRef.indexOf(char) + keyArray[idx]) % 26];
    }

    return upperRef[(upperRef.indexOf(char) + keyArray[idx]) % 26];
  });

  for (let i = 0, j = 0; i < string.length; i += 1) {
    if (/[a-z]/i.test(string[i])) {
      result += newCharArray[j];
      j += 1;
    } else {
      result += string[i];
    }
  }

  return result;
};

console.log(vigenereCipher("Pineapples don't go on pizzas!", 'meat')); // happy
console.log(vigenereCipher('Pineapples don\'t go on pizzas!', 'meat')); // escape chars
console.log(vigenereCipher('', 'meat')); // empty plaintext string
console.log(vigenereCipher("Pineapples don't go on pizzas!", '')); // empty keyword
console.log(vigenereCipher("Pineap1245ples don't go on piz{}[]zas!", 'meat')); // funky chars
console.log(vigenereCipher("Pineapples don't go on pizzas!", 'mEAt')); // multiple-case keyword
