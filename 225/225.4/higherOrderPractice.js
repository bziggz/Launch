// 1

// Higher-order functions can take functions as arguments and/or return functions

// 2

var numbers = [1, 2, 3, 4];
function checkEven(number) {
  return number % 2 === 0;
}

numbers.filter(checkEven); // [2, 4]

// filter is the higher-order function, since it takes checkEven as an argument

// 3

var numbers = [1, 2, 3, 4];
function makeCheckEven() {
  return function(number) {
    return number % 2 === 0;
  }
}

var checkEven = makeCheckEven();

numbers.filter(checkEven); // [2, 4]

// see lines 20-21

// 4

function execute(func, operand) {
  return func(operand);
}

execute(function(number) {
  return number * 2;
}, 10); // 20

execute(function(string) {
  return string.toUpperCase();
}, 'hey there buddy'); // "HEY THERE BUDDY"

// see line 32

// 5

function makeListTransformer(func) {
  return function(list) {
    return list.map(func);
  }
}

var timesTwo = makeListTransformer(function(number) {
  return number * 2;
});

timesTwo([1, 2, 3, 4]); // [2, 4, 6, 8]

// see lines 50-51


