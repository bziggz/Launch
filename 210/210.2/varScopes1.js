// 1

var a = 'outer';

function testScope() {
  var a = 'inner';
  console.log(a);
}

console.log(a);
testScope();
console.log(a);

/* 

outer - per the value of a in the global scope
inner - per the value of a in the local scope
outer - the global a remains unchanged since it was redeclared in the function */

// 2

var a = 'outer';

function testScope() {
  a = 'inner';
  console.log(a);
}

console.log(a);
testScope();
console.log(a);

/*

outer
inner
inner

same as before, except that a was reassigned, rather than redeclared, which
affects the global scope

*/

// 3

var basket = 'empty';

function goShopping() {
  function shop1() {
    basket = 'tv';
  }

  console.log(basket);

  function shop2() {
    basket = 'computer';
  }

  function shop3() {
    var basket = 'play station';
    console.log(basket);
  }

  shop1();
  shop2();
  shop3();

  console.log(basket);
}

goShopping();

/*

var basket = 'empty';

function goShopping() {
  function shop1() {
    basket = 'tv';
  }

  function shop2() {
    basket = 'computer';
  }

  function shop3() {
    var basket = 'play station';
    console.log(basket);
  }

  console.log(basket);

  shop1();
  shop2();
  shop3();

  console.log(basket);
}

goShopping()
---------------------------------------------------
emoty - functions defined but not called
play station - nested local var declared and logged
computer - local var reassigned and logged */

// 4

function hello() {
  a = 'hello';
}

hello();
console.log(a);

// hello - assignment without a declaration creates a global variable

// 5

function hello() {
  var a = 'hello';
}

hello();
console.log(a);

// a is not defined - a was declared only locally

// 6 

console.log(a);

var a = 1;

// undefined - var a is hoisted, but the assignment isn't

// 7

console.log(a);

function hello() {
  a = 1;
}

// 1 - a is not defined. function got hoisted, but never called.

