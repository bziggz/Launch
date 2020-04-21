const staggeredCase = (string) => {
  let result = '';
  let count = 0;

  [...string].forEach((char) => {
    if (/[a-z]/i.test(char)) {
      result += count % 2 === 0 ? char.toUpperCase() : char.toLowerCase();
      count += 1;
    } else {
      result += char;
    }
  });

  return result;
};

console.log(staggeredCase('I Love Launch School!')); // "I lOvE lAuNcH sChOoL!"
console.log(staggeredCase('ALL CAPS')); // "AlL cApS"
console.log(staggeredCase('ignore 77 the 444 numbers')); // "IgNoRe 77 ThE 444 nUmBeRs"
