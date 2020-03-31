const fibonacci = (integer) => {
  if (integer < 2) return integer;

  let [first, second] = [1, 1];

  for (let i = 1; i <= integer; i += 1) {
    [first, second] = [second, first + second];
  }

  return second;
};

const findFibonacciIndexByLength = (integer) => {
  const sequenceOffset = 2;
  for (let i = 1; i <= Infinity; i += 1) {
    if (String(fibonacci(i)).length >= integer) return i + sequenceOffset;
  }
};

console.log(findFibonacciIndexByLength(2)); // 7
console.log(findFibonacciIndexByLength(10)); // 45
console.log(findFibonacciIndexByLength(16)); // 74
