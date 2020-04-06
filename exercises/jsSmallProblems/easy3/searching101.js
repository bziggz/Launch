const num1 = prompt('Enter the 1st number:');
const num2 = prompt('Enter the 2nd number: ');
const num3 = prompt('Enter the 3rd number: ');
const num4 = prompt('Enter the 4th number: ');
const num5 = prompt('Enter the 5th number: ');
const target = prompt('Enter the last number: ');

const numArr = [num1, num2, num3, num4, num5];

const test = (num) => num === target;

if (numArr.some(test)) {
  console.log(`The number ${target} appears in [${numArr}].`);
} else {
  console.log(`The number ${target} does not appear in [${numArr}].`);
}


