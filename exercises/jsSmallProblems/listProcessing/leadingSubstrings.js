const substringsAtStart = (string) => (
  string.split('').map((char, index) => string.slice(0, index + 1))
);

console.log(substringsAtStart('abc')); // ["a", "ab", "abc"]
console.log(substringsAtStart('a')); // ["a"]
console.log(substringsAtStart('xyzzy')); // ["x", "xy", "xyz", "xyzz", "xyzzy"]
