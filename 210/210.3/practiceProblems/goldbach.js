const isPrime = (num) => {
  if ((num > 2 && num % 2 === 0) || num <= 1) return false;

  for (let i = 5; i < num; i += 2) {
    if (num % i === 0) return false;
  }

  return true;
};

const getPrimes = (int) => {
  const primes = [];

  for (let i = 2; i <= int; i += 1) {
    if (isPrime(i)) primes.push(i);
  }
};

const checkGoldbach = (int) => {
  if (int < 4 || int % 2 === 1) {
    console.log(null);
    return;
  }

  const primes = getPrimes(int);

  const primePairs = [];

  primes.forEach((num) => {
    const testNum = int - num;

    if (primes.includes(testNum) && !primePairs.flat().includes(num)) {
      primePairs.push([num, testNum]);
    }
  });

  primePairs.forEach((pair) => console.log(`${pair[0]} ${pair[1]}`));
};


checkGoldbach(3);
checkGoldbach(4);
checkGoldbach(12);
checkGoldbach(100);
