// String to Integer

const stringToInteger = (numString) => numString.split('').reverse()
  .map((num) => ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'].indexOf(num))
  .reduce((accum, num, idx) => accum + (num * (10 ** idx)), 0);

console.log(stringToInteger('4321')); // 4321
console.log(stringToInteger('570')); // 570

// Signed String to Number

const stringToSignedInteger = (numString) => {
  if (numString[0] === '-') return -stringToInteger(numString.slice(1));
  if (numString[0] === '+') return stringToInteger(numString.slice(1));

  return stringToInteger(numString);
};

console.log(stringToSignedInteger('4321')); // 4321
console.log(stringToSignedInteger('-570')); // -570
console.log(stringToSignedInteger('+100')); // 100

// Number to String

const integerToString = (num) => {
  const stringArray = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
  let result = '';

  do {
    result = stringArray[num % 10] + result;
    num = Math.floor(num / 10);
  } while (num >= 1);

  return result;
};

console.log(integerToString(4321)); // "4321"
console.log(integerToString(0)); // "0"
console.log(integerToString(5000)); // "5000"

// Signed Number to String

const signedIntegerToString = (num) => {
  if (num < 0) return `-${integerToString(-num)}`;
  if (num > 0) return `+${integerToString(num)}`;
  return '0';
};

console.log(signedIntegerToString(4321)); // "+4321"
console.log(signedIntegerToString(-123)); // "-123"
console.log(signedIntegerToString(0)); // "0"
