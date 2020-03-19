const myArray = [1, 3, 6, 11, 4, 2, 4, 9, 17, 16, 0];

for (let i = 0; i < myArray.length; i += 1) {
  if (myArray[i] % 2 === 0) {
    console.log(myArray[i]);
  }
}

// ----------------------------------------------------------------

const myArray2 = [[1, 3, 6, 11], [4, 2, 4], [9, 17, 16, 0]];

for (let i = 0; i < myArray2.length; i += 1) {
  const innerArray = myArray2[i];
  for (let x = 0; x < innerArray.length; x += 1) {
    if (innerArray[x] % 2 === 0) {
      console.log(innerArray[x]);
    }
  }
}

// ----------------------------------------------------------------

function evenOddStrings(num) {
  if (num % 2 === 0) {
    return 'even';
  }

  return 'odd';
}

const newArray = myArray.map((num) => evenOddStrings(num));

console.log(newArray);

// ----------------------------------------------------------------

const array = [1, 'a', '1', 3, NaN, 3.1415, -4, null, false];

const removeNonInteger = (arr) => arr.filter((num) => Number.isInteger(num));

const filteredArray = removeNonInteger(array);
console.log(filteredArray); // => [1, 3, -4]

// ----------------------------------------------------------------

const arr6 = ['a', 'abcd', 'abcde', 'abc', 'ab'];
const mapper = (el) => el.length;
const oddLengths = (arr) => arr.map(mapper).filter((el) => el % 2 === 1);

console.log(oddLengths(arr6)); // => [1, 5, 3]

// ----------------------------------------------------------------

const numbers = [3, 5, 7];
const sumOfSquares = (arr) => arr.reduce((acc, el) => acc + (el ** 2), 0);

console.log(sumOfSquares(numbers)); // => 83

// ----------------------------------------------------------------

const reduceArr = ['a', 'abcd', 'abcde', 'abc', 'ab'];

function reduceOddLengths(arr) {
  return arr.reduce((acc, el) => {
    if (el.length % 2 === 1) {
      acc.push(el.length);
    }

    return acc;
  }, []);
}

console.log(reduceOddLengths(reduceArr)); // => [1, 5, 3]

// ----------------------------------------------------------------

const numbers1 = [1, 3, 5, 7, 9, 11];
const numbers2 = [];
const numbers3 = [2, 4, 6, 8];

console.log(numbers1.includes(3));
console.log(numbers2.includes(3));
console.log(numbers3.includes(3));

// ----------------------------------------------------------------

const arr10 = [['test', 'hello', 'world'], ['example', 6, 'mem', null], [4, 8, 12]];

console.log(arr10[1][2]);
