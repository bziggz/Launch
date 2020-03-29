const target = parseInt(prompt('Please enter an integer greater than 0:'), 0);
let operator = prompt('Enter "s" to compute the sum, '
  + 'or "p" to compute the product');

let total = 1;

operator = operator === 's' ? 'sum' : 'product';

for (let i = 2; i <= target; i += 1) {
  operator === 'sum' ? total += i : total *= i;
}

console.log(`The ${operator} of the integers `
  + `between 1 and ${target} is ${total}.`);


// FE

const sum = (accumulator, element) => accumulator + element;
const product = (accumulator, element) => accumulator * element;

const integers = [];
let arrayTotal;

const target = parseInt(prompt('Please enter an integer greater than 0:'), 0);
let operator = prompt('Enter "s" to compute the sum, '
  + 'or "p" to compute the product');

operator = operator === 's' ? 'sum' : 'product';

for (let i = 1; i <= target; i += 1) {
  integers.push(i);
}

if (operator === 'sum') {
  arrayTotal = integers.reduce(sum);
} else {
  arrayTotal = integers.reduce(product);
}

console.log(`The ${operator} of the integers `
  + `between 1 and ${target} is ${arrayTotal}.`);
