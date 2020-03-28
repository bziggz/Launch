const xor = function isXor(arg1, arg2) {
  return !!((arg1 && !arg2) || (!arg1 && arg2));
};

console.log(xor(false, true)); // true
console.log(xor(true, false)); // true
console.log(xor(false, false)); // false
console.log(xor(true, true)); // false


console.log(xor(false, 3)); // true
console.log(xor('a', undefined)); // true
console.log(xor(null, '')); // false
console.log(xor('2', 23)); // false
