const cleanPhoneNumber = (string) => {
  const invalid = '0'.repeat(10);
  const cleanedString = string.replace(/[\D]/g, '');

  if (cleanedString.length === 10) return cleanedString;

  if (cleanedString.length === 11 && cleanedString[0] === '1') {
    return cleanedString.slice(1);
  }

  return invalid;
};

// HAPPY PATHS

// 10

console.log(cleanPhoneNumber('1234567890')); // 1234567890
console.log(cleanPhoneNumber('123-456-7890')); // 1234567890
console.log(cleanPhoneNumber('(123) 456-7890')); // 1234567890
console.log(cleanPhoneNumber('  1 23456sff7e890e>:mn?')); // 1234567890

// 11

console.log(cleanPhoneNumber('11234567890')); // 1234567890
console.log(cleanPhoneNumber('21234567890')); // 0000000000
console.log(cleanPhoneNumber('1(123(45)6789-0')); // 1234567890

// < 10

console.log(cleanPhoneNumber('11234590')); // 0000000000

// > 11

console.log(cleanPhoneNumber('112345613457890')); // 0000000000
