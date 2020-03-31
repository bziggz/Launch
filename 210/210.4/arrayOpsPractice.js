// ------------Push, Pop, Unshift, Shift----------------

// 1 - Push

const count = [0, 1, 2];

const push = (array, value) => {
  array[array.length] = value;
  return array.length;
};

push(count, 3);
console.log(count);

// 2 - Pop

const pop = (array) => {
  const result = array[array.length - 1];
  array.length -= 1;
  return result;
};

pop(count);
console.log(count);

// 3 - Unshift

const unshift = (array, value) => {
  for (let i = array.length; i > 0; i -= 1) {
    array[i] = array[i - 1];
  }

  array[0] = value;

  return array.length;
};

unshift(count, 0);
console.log(count);

// 4 - Shift

const shift = (array) => {
  if (array.length === 0) return undefined;

  const result = array[0];

  for (let i = 0; i < array.length; i += 1) {
    array[i] = array[i + 1];
  }

  array.length -= 1;

  return result;
};

shift(count);
console.log(count);

// -------indexOf, lastIndexOf--------------------------

// 1 - Index Of

const indexOf = (array, value) => {
  const result = -1;

  for (let i = 0; i < array.length; i += 1) {
    if (array[i] === value) return i;
  }

  return result;
};

console.log(indexOf([1, 2, 3, 3], 3)); // 2
console.log(indexOf([1, 2, 3], 4)); // -1

// 2 - Last Index Of

const lastIndexOf = (array, value) => {
  const result = -1;

  for (let i = array.length - 1; i >= 0; i -= 1) {
    if (array[i] === value) return i;
  }

  return result;
};

console.log(lastIndexOf([1, 2, 3, 3], 3)); // 3
console.log(lastIndexOf([1, 2, 3], 4)); // -1

// -------Slice, Splice, Concat, Join--------------------------

// 1 Slice

const slice = (array, start, end) => {
  const result = [];

  for (let i = start; i < end; i += 1) result.push(array[i]);

  return result;
};

console.log(slice([1, 2, 3, 4, 5], 0, 2)); // [ 1, 2 ]
console.log(slice(['a', 'b', 'c', 'd', 'e', 'f', 'g'], 1, 3)); // [ 'b', 'c' ]

// splice

const splice = (array, start, length) => {
  const result = [];

  for (let i = start; i < array.length; i += 1) {
    if (i < start + length) push(result, array[i]);

    array[i] = array[i + length];
  }

  array.length -= result.length;

  return result;
};

const countSplice = [1, 2, 3, 4, 5, 6, 7, 8];

console.log(splice(countSplice, 2, 5)); // [ 3, 4, 5, 6, 7 ]
console.log(countSplice); // [ 1, 2, 8 ]

// concat

const concat = (array1, array2) => {
  const result = array1;

  for (let i = 0; i < array2.length; i += 1) push(result, array2[i]);

  return result;
};

console.log(concat([1, 2, 3], [4, 5, 6])); // [ 1, 2, 3, 4, 5, 6 ]

// join

const join = (array, string) => {
  let result = '';

  for (let i = 0; i < array.length - 1; i += 1) {
    result += String(array[i]);
    result += string;
  }
  return result + array[array.length - 1];
};

console.log(join(['bri', 'tru', 'wha'], 'ck ')); // 'brick truck wha'
console.log(join([1, 2, 3], ' and ')); // '1 and 2 and 3'
