/*

// 1 ----------------------------------

JS is garbage-collected, which means the program handles memory
deallocation, rather than the dev

*/

// 2 -----------------------------------

var myNum = 1;

function foo() {
  var myStr = 'A string';
  // what is eligible for GC here? -- neither
}

foo();

// what is eligible for GC here? -- 'A string'

// 1 isn't eligible for GC now

// more code

// 3 ---------------------------------------

var outerFoo;

function bar() {
  var innerFoo = 0;
  outerFoo = innerFoo;
}

bar();

// can outerFoo's 0 be garbage collected here? -- no, it's global

// more code

// 4 ----------------------------------------

function makeEvenCounter() {
  var index = 0;
  return function() {
    return index += 2;
  };
}

var evenCounter = makeEvenCounter();

// is 0 eligible for GC here? - no, not until evenCounter dereferences it

// more code

// 5 -------------------------------------

var bash = "Some val";

// after the script runs it will be eligible for GC
