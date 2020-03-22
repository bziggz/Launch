logValue();

function logValue() {
  console.log('Hello, world!');
}

/* logs Hello, world!, since the function declaration is hoisted. */

// FE

var logValue = 'foo';

function logValue() {
  console.log('Hello, world!');
}

console.log(typeof logValue);

/* logs string, it's referrring to logValue, not logValue()