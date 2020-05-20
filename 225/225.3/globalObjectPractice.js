// 1

// window serves as the implicit execution context in a browser

// 2

// a = 10;
// console.log(window.a === a);
// would log true

// 3

// function func() {
//   var b = 1;
// }

// func();

// console.log(b);

// would return a reference error, since b is in the function scope

// 4

// function func() {
//   b = 1;
// }

// func();

// console.log(b);

// would log 1, since b is undeclared, and therefore assigned to the global object

// 5

// var a = 1;
// b = 'Hi there';
// var c = '-50';

// delete a; // false
// delete b; // true
// delete c; // false

// b is undeclared, so can be deleted

// 6

// function func() {
//   console.log("I'm a function!");
// }

// delete func; // false - since func is a result of a function declaration

// 7

window.a = 1;
b = 2;
var c = b;

delete window.a; // true
delete window.b; // true
delete window.c; // false 

// directly-added global properties can be deleted






