function myMap(array, func) {
  const result = [];

  array.forEach((element) => result.push(func(element)));

  return result;
}

const plusOne = (n) => n + 1;
console.log(myMap([1, 2, 3, 4], plusOne)); // [ 2, 3, 4, 5 ]
