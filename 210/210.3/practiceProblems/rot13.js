const alphas = 'abcdefghijklmnopqrstuvwxyz';

const encode = (char, cipher, key) => {
  const newIndex = (cipher.indexOf(char) + key) % cipher.length;

  return cipher[newIndex];
};

const rot13 = (string) => {
  const key = 13;
  let result = '';

  for (let i = 0; i < string.length; i += 1) {
    const char = string[i].toLowerCase();
    const isUpperCase = char.toUpperCase() === string[i];

    const newChar = alphas.includes(char) ? encode(char, alphas, key) : char;

    result += isUpperCase ? newChar.toUpperCase() : newChar;
  }

  return result;
};

console.log(rot13('Teachers open the door, but you must enter by yourself.'));

console.log(rot13(rot13('Teachers open the door, but you must enter by yourself.')));