const rotateArray = (array) => {
  if (!Array.isArray(array)) return undefined;
  if (array.length === 0) return [];
  const result = [...array];

  result.push(result.shift());

  return result;
};

const rotateRightmostDigits = (number, digits) => {
  const copy = [...String(number)];

  const arrayParts = [copy.slice(0, -digits), copy.slice(-digits)];

  arrayParts[1] = rotateArray(arrayParts[1]);

  return Number(arrayParts.flat().join(''));
};

const maxRotation = (number) => {
  let result = number;

  for (let i = String(result).length; i > 0; i -= 1) {
    result = rotateRightmostDigits(result, i);
  }

  return result;
};

console.log(maxRotation(735291));// 321579
console.log(maxRotation(3));// 3
console.log(maxRotation(35));// 53
console.log(maxRotation(105));// 15 -- the leading zero gets dropped
console.log(maxRotation(8703529146));// 7321609845
