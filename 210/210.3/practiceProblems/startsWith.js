const startsWith = (string, testString) => {
  let i = 0;

  if (testString === '') return true;

  do {
    if (string[i] !== testString[i]) return false;
    i += 1;
  } while (i < testString.length);

  return true;
};


const str = 'We put comprehension and mastery above all else';
console.log(startsWith(str, 'We')); // true
console.log(startsWith(str, 'We put')); // true
console.log(startsWith(str, '')); // true
console.log(startsWith(str, 'put')); // false

const longerString = 'We put comprehension and mastery above all else!';
console.log(startsWith(str, longerString)); // false
