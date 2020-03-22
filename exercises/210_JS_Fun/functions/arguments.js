// Part 1

var a = 7;

function myValue(b) {
  b += 10;
}

myValue(a);
console.log(a);

/* logs 7, since b is a local variable */

// Part 2

var a = 7;

function myValue(a) {
  a += 10;
}

myValue(a);
console.log(a);

/* logs 7, because of variable shadowing */

// Part 3

var a = [1, 2, 3];

function myValue(b) {
  b[2] += 7;
}

myValue(a);
console.log(a);

/* logs [1, 2, 7], because objects are mutable, in this case
through elemental assignment */