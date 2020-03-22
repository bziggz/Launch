// 1

function average(a, b, c) {
  return (a + b + c) / 3;
}

console.log(average(3, 32, 62));

// 2

function sum(a, b, c) {
  return a + b + c;
}

function averageWithSum(a, b, c) {
  return sum(a, b, c) / 3;
}

console.log(averageWithSum(7, 2, 8));

// 3

function averageWithArray(arr) {
  let total = 0;
  const len = arr.length;

  for (let i = 0; i < len; i += 1) {
    total += arr[i];
  }
  return total / len;
}

console.log(averageWithArray([1, 2, 3, 4, 6]));

// 4

function sumArray(arr) {
  let total = 0;
  const len = arr.length;

  for (let i = 0; i < len; i += 1) {
    total += arr[i];
  }

  return total;
}

function averageWithSumAndArray(arr) {
  return sumArray(arr) / arr.length;
}

console.log(averageWithSumAndArray([5, 7, 3, 654, 6]));

// 5

const temps = [42, 27, 33, 50, 25];

const avgTemp = averageWithSumAndArray(temps);

console.log(avgTemp);
