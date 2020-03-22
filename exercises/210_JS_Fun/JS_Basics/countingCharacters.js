/*
Please enter a phrase: walk
// console output
There are 4 characters in "walk".

Please enter a phrase: walk, don't run
// console output
There are 15 characters in "walk, don't run". */

const rlSync = require('readline-sync');

const str = rlSync.question('Please enter a phrase: ');
console.log(`You entered a string that is ${str.length} characters long.`);

const trimmedStr = str.replace(/[^a-zA-Z]/g, '');
console.log(`Your string contains ${trimmedStr.length} `
  + 'characters from the alphabet.');
console.log(trimmedStr);