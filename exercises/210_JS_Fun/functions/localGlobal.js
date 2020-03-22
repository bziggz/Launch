// Part 1

var myVar = 'This is global';

function someFunction() {
  var myVar = 'This is local';
}

someFunction();
console.log(myVar);

/* logs This is global, since myVar within the function is re-declared */

// Part 2

var myVar = 'This is global';

function someFunction() {
  var myVar = 'This is local';
  console.log(myVar);
}

someFunction();

/* logs This is Local, since the console.log call is in the same scope */

// Part 3

var myVar = 'This is global';

function someFunction() {
  myVar = 'This is local';
}

someFunction();
console.log(myVar);

/* Logs This is local, as myVar is reassigned
