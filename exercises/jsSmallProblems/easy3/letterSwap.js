const letterSwap = (string) => (
  string.slice(-1) + string.slice(1, -1) + string[0]
);

const swap = (string) => string.split(' ')
  .map((word) => (word.length === 1 ? word : letterSwap(word))).join(' ');

console.log(swap('Oh what a wonderful day it is'));// "hO thaw a londerfuw yad ti si"
console.log(swap('Abcde')); // "ebcdA"
console.log(swap('a')); // "a"
