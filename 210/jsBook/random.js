function randomNumberBetween(min, max) {
  return Math.floor(Math.random() * (max - min + 1) + min);
}

// let tries = 0;
// let result = randomNumberBetween(1, 6);
// tries += 1;

// while (result <= 2) {
//   result = randomNumberBetween(1, 6);
//   tries += 1;
// }
let result;
let tries = 0;

for (tries; result <= 2; tries += 1) {
  result = randomNumberBetween(1, 6);
}

console.log('It took ' + String(tries) + ' tries to get a number greater than 2');
