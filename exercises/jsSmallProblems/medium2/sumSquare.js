const sumSquareDifference = (n) => (
  [...new Array(n + 1)].map((_, i) => i)
    .reduce((a, b) => a + b, 0) ** 2
    - [...new Array(n + 1)].map((_, i) => i)
      .reduce((a, b) => a + (b ** 2), 0)
);

console.log(sumSquareDifference(3)); // 22 --> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
console.log(sumSquareDifference(10)); // 2640
console.log(sumSquareDifference(1)); // 0
console.log(sumSquareDifference(100)); // 25164150
