// Part 1

const reverseSentence = (string) => string.split(' ').reverse().join(' ');

console.log(reverseSentence('')); // ""
console.log(reverseSentence('Hello World')); // "World Hello"
console.log(reverseSentence('Reverse these words')); // "words these Reverse"

// Part 2

const reverseWords = (string) => string.split(' ')
  .map((word) => (word.length > 4) ? word.split('').reverse().join('') : word)
  .join(' ');

console.log(reverseWords('Professional')); // "lanoisseforP"
console.log(reverseWords('Walk around the block')); // "Walk dnuora the kcolb"
console.log(reverseWords('Launch School')); // "hcnuaL loohcS"
