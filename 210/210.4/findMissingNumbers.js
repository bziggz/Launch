const missing = (arr) => {
  const result = [];

  for (let i = arr[0]; i < arr[arr.length - 1]; i += 1) {
    if (!arr.includes(i)) result.push(i);
  }

  return result;
};


console.log(missing([-3, -2, 1, 5])); // [-1, 0, 2, 3, 4]
console.log(missing([1, 2, 3, 4])); // []
console.log(missing([1, 5])); // [2, 3, 4]
console.log(missing([6])); // []
