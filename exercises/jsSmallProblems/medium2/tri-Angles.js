const triangle = (...angles) => {
  const sorted = [...angles].sort((a, b) => a - b);

  if (sorted[0] <= 0 || sorted.reduce((a, b) => a + b) !== 180) return 'invalid';

  if (sorted.every((angle) => angle < 90)) return 'acute';
  if (sorted.includes(90)) return 'right';

  return 'obtuse';
};

console.log(triangle(60, 70, 50)); // "acute"
console.log(triangle(30, 90, 60)); // "right"
console.log(triangle(120, 50, 10)); // "obtuse"
console.log(triangle(0, 90, 90)); // "invalid"
console.log(triangle(50, 50, 50)); // "invalid"
