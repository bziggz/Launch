function octalToDecimal(numberString) {
  return numberString.split('').reverse()
    .map((digitString, index) => parseInt(digitString, 10) * (8 ** index))
    .reduce((acc, el) => acc + el, 0);
}

console.log(octalToDecimal('1')); // 1
console.log(octalToDecimal('10')); // 8
console.log(octalToDecimal('130')); // 88
console.log(octalToDecimal('17')); // 15
console.log(octalToDecimal('2047')); // 1063
console.log(octalToDecimal('011')); // 9
