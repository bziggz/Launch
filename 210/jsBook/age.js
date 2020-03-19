const rlSync = require('readline-sync');

const age = Number(rlSync.question('How old are you?\n'));

// console.log(`You are ${age} years old.`);
// console.log(`In 10 years, you will be ${age + 10} years old.`);
// console.log(`In 20 years, you will be ${age + 20} years old.`);
// console.log(`In 30 years, you will be ${age + 30} years old.`);
// console.log(`In 40 years, you will be ${age + 40} years old.`);

for (let increment = 0; increment <= 40; increment += 10) {
  if (increment === 0) {
    console.log(`You are ${age} years old.`);
  } else {
    const newAge = age + increment;
    console.log(`In ${increment} years you will be ${newAge} years old.`);
  }
}
