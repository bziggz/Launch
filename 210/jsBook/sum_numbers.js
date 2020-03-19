let rlSync = require('readline-sync');

let num1 = Number(rlSync.question("Enter the first number:\n"));
let num2 = Number(rlSync.question("Enter the second number:\n"));
let sum = num1 + num2;

console.log(`The numbers ${num1} and ${num2} add up to ${sum}.`)