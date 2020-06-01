// 1

// function() {
//   console.log("Sometimes, syntax isn't intuitive!")
// }();

// Uncaught Syntax Error

// 2

(function() {
  console.log("Sometimes, syntax isn't intuitive!")
})();

 // 3

// var sum = 0;
// var numbers;

// sum += 10;
// sum += 31;

// numbers = [1, 7, -3, 3];

// function sum(arr) {
//   return arr.reduce(function(sum, number) {
//     sum += number;
//     return sum;
//   }, 0);
// }

// sum += sum(numbers); 

// sum can't be a variable and a function

var sum = 0;
var numbers;

sum += 10;
sum += 31;

numbers = [1, 7, -3, 3];

sum += (function(arr) {
  return arr.reduce(function(sum, number) {
    sum += number;
    return sum;
  }, 0);
})(numbers);

// 4

var countdown = (count) => {
  (function () {
    for (let i = count; i >= 0; i -= 1) {
      console.log(i);
    }
  })(count);
};

countdown(7);

// 5

// no, because it's an iife

// 6

var countdown = (count) => {
  (function () {
    console.log(count)
    if (count === 0 ) return;
    countdown(count - 1);
  })(count);
};

countdown(7);