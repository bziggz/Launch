// Part 1

const repeater = (string) => {
  let result = '';

  for (const char of string) result += `${char}${char}`;

  return result;
};

console.log(repeater('Hello')); // "HHeelllloo"
console.log(repeater('Good job!')); // "GGoooodd  jjoobb!!"
console.log(repeater('')); // ""

// Part 2

const doubleConsonants = (string) => {
  let result = '';

  for (let i = 0; i < string.length; i += 1) {
    if (/[bcdfghjklmnpqrstvwxyz]/i.test(string[i])) {
      result += `${string[i]}${string[i]}`;
    } else {
      result += string[i];
    }
  }

  return result;
};

console.log(doubleConsonants('String')); // "SSttrrinngg"
console.log(doubleConsonants('Hello-World!')); // "HHellllo-WWorrlldd!"
console.log(doubleConsonants('July 4th')); // "JJullyy 4tthh"
console.log(doubleConsonants('')); // ""
