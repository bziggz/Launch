const swapCase = (string) => (
  [...string].map((char) => (
    /[a-z]/.test(char) ? char.toUpperCase() : char.toLowerCase()
  )).join('')
);

console.log(swapCase('CamelCase')); // "cAMELcASE"
console.log(swapCase('Tonight on XYZ-TV')); // "tONIGHT ON xyz-tv"
