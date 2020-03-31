const stringy = (num) => {
  let result = '';

  for (let i = 1; i <= num; i += 1) result += String(i % 2);

  return result;
};

console.log(stringy(6)); // "101010"
console.log(stringy(9)); // "101010101"
console.log(stringy(4)); // "1010"
console.log(stringy(7)); // "1010101"
