// let victorsName = 'Victor'

// let morningGreeting = `Good Morning, ${victorsName}!`
// let afternoonGreeting = `Good Afternoon, ${victorsName}!`
// let eveningGreeting = `Good Evening, ${victorsName}!`

// console.log(morningGreeting)
// console.log(afternoonGreeting)
// console.log(eveningGreeting)

// ---------------------------------------------------------

// const rlSync = require('readline-sync');

// const firstName = rlSync.question('What is your first name?\n');
// const lastName = rlSync.question('What is your last name?\n');
// console.log(`Hello, ${firstName} ${lastName}!`);

// ----------------------------------------------------------

function getName(prompt) {
  const rlSync = require('readline-sync');
  const name = rlSync.question(prompt);
  return name;
}

const first = getName('What is your first name?\n');
const last = getName('What is your last name?\n');

console.log(`Hello, ${first} ${last}!`);
