// Code Snippet 1

var counter = 5;
var rate = 3;
console.log('The total value is ' + String(counter * rate));

function counter(count) {
  // ...
}

/* 'The total value is 15' */

// Code Snippet 2

function counter(count) {
  // ...
}

console.log('The total value is ' + String(counter * rate));

var counter = 5;
var rate = 3;

/* 'The total value is NaN' - counter is reassigned to undefined by hoisting*/

// Code Snippet 3

var counter = 5;
var rate = 3;

function counter(count) {
  // ...
}

console.log('The total value is ' + String(counter * rate));

/* 'The total value is 15' - function is hoisted above the var */