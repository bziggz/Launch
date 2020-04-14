// Write a Function named totalArea that takes an 
// Array of rectangles as an argument. The Function 
// should return the total area covered by all the rectangles.


const rectangles = [[3, 4], [6, 6], [1, 8], [9, 9], [2, 2]];

const totalArea = (array) => array.reduce((acc, el) => acc + el[0] * el[1], 0);

console.log(totalArea(rectangles)); // 141

const totalSquareArea = (array) => totalArea(array.filter((el) => el[0] === el[1]));

console.log(totalSquareArea(rectangles)); // 121
