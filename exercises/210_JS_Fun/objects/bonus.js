function calculateBonus() {
  return arguments[1] ? arguments[0] / 2 : 0;
}

console.log(calculateBonus(2800, true)); // 1400
console.log(calculateBonus(1000, false)); // 0
console.log(calculateBonus(50000, true)); // 25000

// works because of the arguments function - ES5

// for ES6 use

function calculateBonus(...args) {
  return args[1] ? args[0] / 2 : 0;
}
