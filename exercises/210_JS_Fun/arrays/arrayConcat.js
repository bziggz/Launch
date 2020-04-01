// Part 1

function concat(array1, secondArgument) {
  const result = array1.slice();

  if (!Array.isArray(secondArgument)) {
    result.push(secondArgument);
  } else {
    for (let i = 0; i < secondArgument.length; i += 1) {
      result.push(secondArgument[i]);
    }
  }

  return result;
}

console.log(concat([1, 2, 3], [4, 5, 6])); // [1, 2, 3, 4, 5, 6]
console.log(concat([1, 2], 3)); // [1, 2, 3]
console.log(concat([2, 3], ['two', 'three'])); // [2, 3, "two", "three"]
console.log(concat([2, 3], 'four')); // [2, 3, "four"]

const obj = { a: 2, b: 3 };
const newArray = concat([2, 3], obj);
console.log(newArray); // [2, 3, { a: 2, b: 3 }]
obj.a = 'two';
console.log(newArray); // [2, 3, { a: "two", b: 3 }]

const arr1 = [1, 2, 3];
const arr2 = [4, 5, obj];
const arr3 = concat(arr1, arr2);
console.log(arr3); // [1, 2, 3, 4, 5, { a: "two", b: 3 }]
obj.b = 'three';
console.log(arr3); // [1, 2, 3, 4, 5, { a: "two", b: "three" }]

arr3[5].b = 3; // or, `arr3[5]['b'] = 3;`
console.log(obj); // { a: "two", b: 3 }

// Part 2

function concat2(array1, ...secondArguments) {
  const result = Array.from(array1);

  for (let i = 0; i < secondArguments.length; i += 1) {
    if (Array.isArray(secondArguments[i])) {
      for (let j = 0; j < secondArguments[i].length; j += 1) {
        result.push(secondArguments[i][j]);
      }
    } else {
      result.push(secondArguments[i]);
    }
  }

  return result;
}

console.log(concat2([1, 2, 3], [4, 5, 6], [7, 8, 9])); // [1, 2, 3, 4, 5, 6, 7, 8, 9]
console.log(concat2([1, 2], 'a', ['one', 'two'])); // [1, 2, "a", "one", "two"]
console.log(concat2([1, 2], ['three'], 4)); // [1, 2, "three", 4]
