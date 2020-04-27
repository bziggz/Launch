const triangle = (...sides) => {
  const sorted = [...sides].sort((a, b) => a - b);

  if (sorted[0] <= 0 || sorted[0] + sorted[1] <= sorted[2]) return 'invalid';

  if (sorted[0] === sorted[2]) return 'equilateral';
  if (sorted[0] === sorted[1] || sorted[1] === sorted[2]) return 'isosceles';

  return 'scalene';
};


console.log(triangle(3, 3, 3)); // "equilateral"
console.log(triangle(3, 3, 1.5)); // "isosceles"
console.log(triangle(3, 4, 5)); // "scalene"
console.log(triangle(0, 3, 3)); // "invalid"
console.log(triangle(3, 1, 1)); // "invalid"
