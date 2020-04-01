function slice(array, begin, end) {
  const result = [];

  begin = begin > array.length ? array.length : begin;
  end = end > array.length ? array.length : end;

  for (let i = begin; i < end; i += 1) result.push(array[i]);

  return result;
}

console.log(slice([1, 2, 3], 1, 2)); // [2]
console.log(slice([1, 2, 3], 2, 0)); // []
console.log(slice([1, 2, 3], 5, 1)); // []
console.log(slice([1, 2, 3], 0, 5)); // [1, 2, 3]

let arr = [1, 2, 3];
console.log(slice(arr, 1, 3)); // [2, 3]
console.log(arr); // [1, 2, 3]

function splice(array, start, deleteCount, ...elements) {
  start = start > array.length ? array.length : start;
  deleteCount = deleteCount > (array.length - start) ? array.length - start : deleteCount;

  const arrayCopy = Array.from(array);

  array.length = array.length + elements.length - deleteCount;

  for (let i = 0; i < elements.length; i += 1) {
    array[start + i] = elements[i];
  }

  const replaceCount = arrayCopy.length - (start + deleteCount);

  for (let i = 0; i < replaceCount; i += 1) {
    array[start + elements.length + i] = arrayCopy[start + deleteCount + i];
  }

  return slice(arrayCopy, start, start + deleteCount);
}

console.log(splice([1, 2, 3], 1, 2)); // [2, 3]
console.log(splice([1, 2, 3], 1, 3)); // [2, 3]
console.log(splice([1, 2, 3], 1, 0)); // []
console.log(splice([1, 2, 3], 0, 1)); // [1]
console.log(splice([1, 2, 3], 1, 0, 'a')); // []

arr = [1, 2, 3];
console.log(splice(arr, 1, 1, 'two')); // [2]
console.log(arr); // [1, "two", 3]

arr = [1, 2, 3];
console.log(splice(arr, 1, 2, 'two', 'three')); // [2, 3]
console.log(arr); // [1, "two", "three"]

arr = [1, 2, 3];
console.log(splice(arr, 1, 0)); // []
console.log(splice(arr, 1, 0, 'a')); // []
console.log(arr); // [1, "a", 2, 3]

arr = [1, 2, 3];
console.log(splice(arr, 0, 0, 'a')); // []
console.log(arr); // ["a", 1, 2, 3]
