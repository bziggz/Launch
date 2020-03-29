const alphas = 'abcdefghijklmnopqrstuvwxyz';

const encode = (char, cipher, key) => {
  if (cipher.includes(char)) {
    const index = cipher.indexOf(char);

    const newIndex = (index + key) % cipher.length;

    return cipher[newIndex];
  }

  return char;
};

const rot13 = (string) => {
  const key = 13;
  let result = '';

  for (let i = 0; i < string.length; i += 1) {
    const char = string[i].toLowerCase();

    const newChar = encode(char, alphas, key);

    const isUpperCase = char.toUpperCase() === string[i];

    result += isUpperCase ? newChar.toUpperCase() : newChar;
  }

  return result;
};

console.log(rot13('Teachers open the door, but you must enter by yourself.'));

console.log(rot13(rot13('Teachers open the door, but you must enter by yourself.')));
