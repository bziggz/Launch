var person = { name: 'Victor' };
var otherPerson = { name: 'Victor' };

console.log(person === otherPerson);    // false -- expected: true

/* returns false because person and otherPerson point to two 
different objects */

// Refactor

var person = { name: 'Victor' };
var otherPerson = person;

console.log(person === otherPerson);