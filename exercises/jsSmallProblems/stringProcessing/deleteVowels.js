const removeVowels = (array) => (
  array.map((string) => string.match(/[^aeiou]*/gi).join(''))
);


console.log(removeVowels(['abcdefghijklmnopqrstuvwxyz'])); // ["bcdfghjklmnpqrstvwxyz"]
console.log(removeVowels(['green', 'YELLOW', 'black', 'white'])); // ["grn", "YLLW", "blck", "wht"]
console.log(removeVowels(['ABC', 'AEIOU', 'XYZ'])); // ["BC", "", "XYZ"]
