const substringsAtStart = (string) => (
  [...string].map((_, i) => string.slice(0, i + 1))
);

const substrings = (string) => (
  [...string].map((_, i) => substringsAtStart(string.slice(i))).flat()
);

const isPalindrome = (string) => {
  for (let i = 0; i < string.length; i += 1) {
    if (string[i] !== string[string.length - 1 - i]) return false;
  }

  return true;
};

const palindromes = (string) => substrings(string)
  .filter((substring) => isPalindrome(substring) && substring.length > 1);

console.log(palindromes('abcd'));       // []
console.log(palindromes('madam'));      // [ "madam", "ada" ]

console.log(palindromes('hello-madam-did-madam-goodbye'));
// returns
// [ "ll", "-madam-", "-madam-did-madam-", "madam", "madam-did-madam", "ada",
  // "adam-did-mada", "dam-did-mad", "am-did-ma", "m-did-m", "-did-", "did",
  // "-madam-", "madam", "ada", "oo" ]

console.log(palindromes('knitting cassettes'));
// returns
// [ "nittin", "itti", "tt", "ss", "settes", "ette", "tt" ]