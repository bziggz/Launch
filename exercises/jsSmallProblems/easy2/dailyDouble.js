const crunch = (string) => {
  let result = '';

  for (let i = 0; i < string.length; i += 1) {
    const last = result.length - 1;
    if (result[last] !== string[i]) result += string[i];
  }

  return result;
};


console.log(crunch('ddaaiillyy ddoouubbllee')); // "daily double"
console.log(crunch('4444abcabccba')); // "4abcabcba"
console.log(crunch('ggggggggggggggg')); // "g"
console.log(crunch('a')); // "a"
console.log(crunch('')); // ""
