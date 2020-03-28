const alphabet = 'abcdefghijklmnopqrstuvwxyz';

const rotEncode = (char, cypher) => {
  const key = 13;

  const newIndex = (cypher.indexOf(char) + key) % cypher.length;

  return cypher[newIndex];
};

const rot13 = (string) => {
  let result = '';

  for (let i = 0; i < string.length; i += 1) {
    const char = string[i].toLowerCase();
    const isUpperCase = char.toUpperCase() === string[i];

    const newChar = alphabet.includes(char) ? rotEncode(char, alphabet) : char;

    result += isUpperCase ? newChar.toUpperCase() : newChar;
  }

  return result;
};

console.log(rot13('Teachers open the door, but you must enter by yourself.'));

console.log(rot13(rot13('Teachers open the door, but you must enter by yourself.')));
