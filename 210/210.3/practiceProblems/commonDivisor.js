const gcd = function gcd(num1, num2) {
  let [larger, smaller] = num1 > num2 ? [num1, num2] : [num2, num1];

  do {
    const remainder = larger % smaller;
    if (remainder === 0) break;
    [larger, smaller] = [smaller, remainder];
  } while (smaller > 0);

  return smaller;
};

console.log(gcd(12, 4)); // 4
console.log(gcd(15, 10)); // 5
console.log(gcd(9, 2)); // 1

// FE

const gcdArray = (arr) => {
  let temp;

  do {
    temp = gcd((temp || arr.pop()), arr.pop());
  } while (arr.length >= 2);

  return temp;
};

console.log(gcd(12, gcd(4, 8))); // 4
console.log(gcdArray([12, 8, 4])); // 4

console.log(gcd(gcd(81, 63), gcd(99, 54))); // 9
console.log(gcdArray([81, 54, 63, 99])); // 9
