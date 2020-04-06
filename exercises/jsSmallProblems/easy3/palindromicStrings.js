// Part 1 - case sensitive

const isPalindrome = (string) => {
  for (let i = 0; i < string.length / 2; i += 1) {
    if (string[i] !== string[string.length - 1 - i]) return false;
  }

  return true;
};

console.log(isPalindrome('madam')); // true
console.log(isPalindrome('Madam')); // false (case matters)
console.log(isPalindrome("madam i'm adam")); // false (all characters matter)
console.log(isPalindrome('356653')); // true

// Part 2 - case insensitive

const isRealPalindrome = (string) => {
  const testString = string.toLowerCase().replace(/[^\w]/g, '');

  return testString === testString.split('').reverse().join('');
};

console.log(isRealPalindrome('madam')); // true
console.log(isRealPalindrome('Madam')); // true (case does not matter)
console.log(isRealPalindrome("Madam, I'm Adam"));// true (only alphanumerics matter)
console.log(isRealPalindrome('356653')); // true
console.log(isRealPalindrome('356a653')); // true
console.log(isRealPalindrome('123ab321')); // false
