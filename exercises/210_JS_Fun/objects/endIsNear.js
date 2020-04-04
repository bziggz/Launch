// this function is trying to access a non-existant index

function penultimate(string) {
  return string.split(' ')[-2];
}

//this function corrects for that

function penultimate2(string) {
  const stringArr = string.split(' ');
  return stringArr[stringArr.length - 2];
}

console.log(penultimate('last word')); // expected: "last"
console.log(penultimate('Launch School is great!')); // expected: "is"

console.log(penultimate2('last word')); // expected: "last"
console.log(penultimate2('Launch School is great!')); // expected: "is"
