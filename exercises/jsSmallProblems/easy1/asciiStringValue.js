const asciiValue = (string) => {
  let total = 0;

  for (let i = 0; i < string.length; i += 1) {
    total += string.charCodeAt(i);
  }

  return total;
};


console.log(asciiValue('Four score')); // 984
console.log(asciiValue('Launch School')); // 1251
console.log(asciiValue('a')); // 97
console.log(asciiValue('')); // 0
