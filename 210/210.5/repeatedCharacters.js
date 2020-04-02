
const repeatedCharacters = (string) => {
  const charCount = {};

  for (let i = 0; i < string.length; i += 1) {
    const key = string[i].toLowerCase();
    charCount[key] = charCount[key] + 1 || 1;
  }

  for (const key in charCount) {
    if (charCount[key] === 1) delete charCount[key];
  }

  return charCount;
};

console.log(repeatedCharacters('Programming')); // { r: 2, g: 2, m: 2 }
console.log(repeatedCharacters('Combination')); // { o: 2, i: 2, n: 2 }
console.log(repeatedCharacters('Pet')); // {}
console.log(repeatedCharacters('Paper')); // { p: 2 }
console.log(repeatedCharacters('Baseless')); // { s: 3, e: 2 }
