// Part 1

var myArray = [1, 2, 3, 4];
var myOtherArray = myArray;

myArray.pop();
console.log(myOtherArray);

myArray = [1, 2];
console.log(myOtherArray);

/* Both log [1, 2, 3] - 
both point to the same object until myArray is reassigned */

// Part 2

var myArray = [1, 2, 3, 4];
var myOtherArray = myArray.slice();

  // OR

var myOtherArray = [];
myOtherArray.push(myArray);
myOtherArray = myOtherArray.flat()

myArray.pop();
console.log(myOtherArray);

myArray = [1, 2];
console.log(myOtherArray);

// Part 3