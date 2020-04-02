// Radians to Degrees

const radianToDegrees = (radians) => (radians * 180) / Math.PI;

// Abs

const neg = -180;

console.log(Math.abs(neg));

// Square Root

console.log(Math.sqrt(16777216));

// Multiple Powers

console.log(Math.pow(16, 6));

// Roung, Floor, Ceiling

const a = 50.72;
const b = 49.2;
const c = 49.86;

console.log(Math.floor(a));
console.log(Math.ceil(b));
console.log(Math.round(c));

// Random

const randomInRange = (min, max) => {
  if (min === max) return min;
  [min, max] = min > max ? [max, min] : [min, max];

  const range = max - min + 1;
  return Math.floor(Math.random() * range + min);
};

console.log(randomInRange(1, 5));