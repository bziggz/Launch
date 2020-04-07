const negative = (num) => -Math.abs(num);

console.log(negative(5)); // -5
console.log(negative(-3)); // -3
console.log(negative(0)); // -0

const ternaryNegative = (num) => num >= 0 ? -num : num;

console.log(ternaryNegative(5)); // -5
console.log(ternaryNegative(-3)); // -3
console.log(ternaryNegative(0)); // -0
