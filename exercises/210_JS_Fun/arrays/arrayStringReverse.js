function reverse(inputForReversal) {
  let result;

  if (Array.isArray(inputForReversal)) {
    result = [];
    for (let i = inputForReversal.length - 1; i >= 0; i -= 1) {
      result.push(inputForReversal[i]);
    }
  } else {
    result = '';
    for (let i = inputForReversal.length - 1; i >= 0; i -= 1) {
      result += inputForReversal[i];
    }
  }

  return result;
}

console.log(reverse('Hello')); // "olleH"
console.log(reverse('a')); // "a"
console.log(reverse([1, 2, 3, 4])); // [4, 3, 2, 1]
console.log(reverse([])); // []

let array = [1, 2, 3];
console.log(reverse(array)); // [3, 2, 1]
console.log(array); // [1, 2, 3]
