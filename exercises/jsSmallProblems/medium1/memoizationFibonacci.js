const fibonacciNums = {};

const fibonacci = (n) => {
  if (n <= 2) return 1;

  if (fibonacciNums[n]) return fibonacciNums[n];

  fibonacciNums[n] = fibonacci(n - 1) + fibonacci(n - 2);

  return fibonacciNums[n];
};

console.log(fibonacci(78));
