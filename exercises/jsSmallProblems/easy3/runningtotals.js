const runningTotal = (arr) => {
  if (arr.length === 0) return [];
  const result = [arr[0]];


  for (let i = 1; i < arr.length; i += 1) {
    const resultSum = arr.slice(0, i).reduce((accum, element) => accum + element);

    result.push(arr[i] + resultSum);
  }

  return result;
};

console.log(runningTotal([2, 5, 13])); // [2, 7, 20]
console.log(runningTotal([14, 11, 7, 15, 20])); // [14, 25, 32, 47, 67]
console.log(runningTotal([3])); // [3]
console.log(runningTotal([])); // []
