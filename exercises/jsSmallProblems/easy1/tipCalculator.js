const bill = parseFloat(prompt('What is the bill?'));
const percent = parseFloat(prompt('What is the tip percentage?'));

const tip = bill * (percent / 100);
const total = bill + tip;

console.log(`The tip is $${tip.toFixed(2)}`);
console.log(`The total is $${total.toFixed(2)}`);
