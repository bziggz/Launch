const sum = (number) => String(number).split('')
  .map((stringDigit) => Number(stringDigit))
  .reduce((total, digit) => total + digit, 0);

console.log(sum(23)); // 5
console.log(sum(496)); // 19
console.log(sum(123456789)); // 45
