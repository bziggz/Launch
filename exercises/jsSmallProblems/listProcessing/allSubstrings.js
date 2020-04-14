const substringsAtStart = (string) => (
  [...string].map((_, i) => string.slice(0, i + 1))
);

const substrings = (string) => (
  [...string].map((_, i) => substringsAtStart(string.slice(i))).flat()
);

console.log(substrings('abcde'));

// returns
// [ "a", "ab", "abc", "abcd", "abcde",
//   "b", "bc", "bcd", "bcde",
//   "c", "cd", "cde",
//   "d", "de",
//   "e" ]
