// 1

function say() {
  if (false) {
    var a = 'hello from inside a block';
  }

  console.log(a);
}

say();

/* undefined - var a is hoisted above the conditional, but since it never
follows that branch, it's never assigned. */

// 2

function hello() {
  a = 'hello';
  console.log(a);

  if (false) {
    var a = 'hello again';
  }
}

hello();
console.log(a);

/* 
a = 'hello';

function hello() {
  var a;
  a = 'hello';
  console.log(a);

  if (false) {
    a = 'hello again';
  }
}

hello();
console.log(a);

hello - var is hoisted and then assigned to a
a is not defined error - because var was hoisted, it isn't global */

// 3

var a = 'hello';

for (var i = 0; i < 5; i += 1) {
  var a = i;
}

console.log(a);

// output: 4 - a for loop isn't scoped, so a keeps being reassigned to i

// 4

var a = 1;

function foo() {
  a = 2;
  function bar() {
    a = 3;
    return 4;
  }

  return bar();
}

console.log(foo());
console.log(a);

/* 

4 - logs the return value of bar(), which is 4
3 - that call to bar() reassigns a to 3 */

// 5

var a = 'global';

function checkScope() {
  var a = 'local';
  function nested() {
    var a = 'nested';
    function superNested() {
      a = 'superNested';
      return a;
    }

    return superNested();
  }

  return nested();
}

console.log(checkScope());
console.log(a);

/*

supernested - traces all the way through the function calls
global - shadowed by the local and nested declarations */

// 6

var a = 'outer';
var b = 'outer';

console.log(a);
console.log(b);
setScope(a);
console.log(a);
console.log(b);

function setScope(foo) {
  foo = 'inner';
  b = 'inner';
}

/* 

outer
outer
outer - reassigned the local variable foo, not a
inner - reassigned b */

// 7

var total = 50;
var increment = 15;

function incrementBy(increment) {
  total += increment;
}

console.log(total);
incrementBy(10);
console.log(total);
console.log(increment);

/*

50
60 - increment is a local var based on the argument provided
15 - var increment remains unchanged by the function */

// 8

var a = 'outer';

console.log(a);
setScope();
console.log(a);

var setScope = function () {
  a = 'inner';
};

/* 
outer
setScope is not a function */




