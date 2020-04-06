const currentAge = prompt('What is your age?');
const retireAge = prompt('At what age would you like to retire?');

const yearsLeft = retireAge - currentAge;

const currentYear = Date().getFullYear();

const retireYear = currentYear + yearsLeft;

console.log(`It's ${currentYear}. You will retire in ${retireYear}.`);
console.log(`You have only ${yearsLeft} years of work to go!`);
