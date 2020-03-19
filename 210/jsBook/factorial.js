function factorial(num) {
  let result = 1;
  for (let i = num; i > 1; i -= 1) {
    result *= i;
  }
  return result;
}

console.log(factorial(0));// => 1
console.log(factorial(1));// => 1
console.log(factorial(2));// => 2
console.log(factorial(3));// => 6
console.log(factorial(4));// => 24
console.log(factorial(5));// => 120
console.log(factorial(6));// => 720
console.log(factorial(7));// => 5040
console.log(factorial(8));// => 40320

function recFactorial(num) {
  if (num <= 1) {
    return 1;
  }
  return num * recFactorial(num - 1);
}

console.log(recFactorial(0));// => 1
console.log(recFactorial(1));// => 1
console.log(recFactorial(2));// => 2
console.log(recFactorial(3));// => 6
console.log(recFactorial(4));// => 24
console.log(recFactorial(5));// => 120
console.log(recFactorial(6));// => 720
console.log(recFactorial(7));// => 5040
console.log(recFactorial(8));// => 40320
