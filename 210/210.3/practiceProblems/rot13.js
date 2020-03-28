const cypher = 'abcdefghijklmnopqrstuvwxyz';

const encode = (char, cypher, key) => {
  const newIndex = (cypher.indexOf(char) + key) % cypher.length;

  return cypher[newIndex];
};

const rot13 = (string) => {
  const key = 13;
  let result = '';

  for (let i = 0; i < string.length; i += 1) {
    const char = string[i].toLowerCase();
    const isUpperCase = char.toUpperCase() === string[i];

    const newChar = cypher.includes(char) ? encode(char, cypher, key) : char;

    result += isUpperCase ? newChar.toUpperCase() : newChar;
  }

  return result;
};

console.log(rot13('Teachers open the door, but you must enter by yourself.'));

console.log(rot13(rot13('Teachers open the door, but you must enter by yourself.')));
