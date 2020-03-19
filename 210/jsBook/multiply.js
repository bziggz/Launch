function multiply() {
  const rlSync = require('readline-sync');

  const num1 = rlSync.question('Enter the first number: ');
  const num2 = rlSync.question('Enter the second number: ');
  const result = num1 * num2;
  return `${num1} * ${num2} = ${result}`;
}

// console.log(multiply());


function times(number1, number2) {
  const result = number1 * number2;
  console.log(result);
  return result;
}

const oneFactorial = times(1, 1);
const twoFactorial = times(2, oneFactorial);
const threeFactorial = times(3, twoFactorial);
const fourFactorial = times(4, threeFactorial);
times(5, fourFactorial);
