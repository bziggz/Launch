const sequence = (num) => [...new Array(num)].map((_, i) => i + 1);

console.log(sequence(5)); // [1, 2, 3, 4, 5]
console.log(sequence(3)); // [1, 2, 3]
console.log(sequence(1)); // [1]
