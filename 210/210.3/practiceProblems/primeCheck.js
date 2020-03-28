const prime = function isPrime(num) {
  if ((num > 2 && num % 2 === 0) || num <= 1) return false;

  for (let i = 5; i < num; i += 2) {
    if (num % i === 0) return false;
  }

  return true;
};

console.log(prime(1)); // false
console.log(prime(2)); // true
console.log(prime(3)); // true
console.log(prime(43)); // true
console.log(prime(55)); // false
console.log(prime(0)); // false
