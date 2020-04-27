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


console.log(rotateRightmostDigits(735291, 1)); // 735291
console.log(rotateRightmostDigits(735291, 2)); // 735219
console.log(rotateRightmostDigits(735291, 3)); // 735912
console.log(rotateRightmostDigits(735291, 4)); // 732915
console.log(rotateRightmostDigits(735291, 5)); // 752913
console.log(rotateRightmostDigits(735291, 6)); // 352917
