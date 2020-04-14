function myReduce(array, func, initial = array[0]) {
  let result = initial;

  array.forEach((element) => {
    result = func(result, element);
  });

  return result;
}

const smallest = (result, value) => (result <= value ? result : value);
const sum = (result, value) => result + value;

console.log(myReduce([5, 12, 15, 1, 6], smallest)); // 1
console.log(myReduce([5, 12, 15, 1, 6], sum, 10)); // 49
