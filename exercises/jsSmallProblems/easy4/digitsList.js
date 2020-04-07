const digitList = (num) => String(num).split('')
  .map((digit) => parseInt(digit, 10));

console.log(digitList(12345)); // [1, 2, 3, 4, 5]
console.log(digitList(7)); // [7]
console.log(digitList(375290)); // [3, 7, 5, 2, 9, 0]
console.log(digitList(444)); // [4, 4, 4]
