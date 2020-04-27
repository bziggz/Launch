const fibonacci = (n) => {
  if (n <= 2) return 1;

  let num1 = 1;
  let num2 = 1;

  for (let i = 2; i < n; i += 1) {
    [num1, num2] = [num2, num1 + num2];
  }

  return num2;
};

console.log(fibonacci(20)); // 6765
console.log(fibonacci(50)); // 12586269025
console.log(fibonacci(75)); // 2111485077978050
