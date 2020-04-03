// Part 1

var myArray = ['a', 'b', 'c'];

console.log(myArray[0]); // 'a'
console.log(myArray[-1]); // undefined

myArray[-1] = 'd';
myArray['e'] = 5;
myArray[3] = 'f';

console.log(myArray[-1]); // 'd'
console.log(myArray['e']); // 5
console.log(myArray); // ['a', 'b', 'c', 'f', -1: 'd', 'e': 5]

// Part 2

var myArray = [5, 5];
myArray[-1] = 5;
myArray[-2] = 5;

function average(array) {
  var sum = 0;
  var i;
  // var count = 0; // added during refactor

  for (i = -2; i < array.length; i += 1) {
    sum += array[i];
    // count += 1; // added during refactor
  }

  return sum / array.length; // change array.length to count to refactor;
}

console.log(average(myArray));

// will not work. all values were logged, but array.length only counted the indices