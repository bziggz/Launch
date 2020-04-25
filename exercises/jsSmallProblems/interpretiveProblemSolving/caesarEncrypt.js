// input - a string and a key (num)
// output - an encoded string with each char shifted to the left key indexes

// Algorithm:

// create a reference alphabet string
// create result string


// iterate over string
//   if char is alphabetical, shift key spaces
//   modulo 26 to wrap indices
//   push new char to result string
  
// return result string
  
const caesarEncrypt = (string, key) => {
  const reference = 'abcdefghijklmnopqrstuvwxyz';
  let result = '';
  
  for (let i = 0; i < string.length; i += 1) {
    if (/[a-z]/i.test(string[i])) {
        const newChar = reference[(reference.indexOf(string[i].toLowerCase()) + key) % 26];
        result += /[A-Z]/.test(string[i]) ? newChar.toUpperCase() : newChar;
    } else {
      result += string[i];
    }
  }
  
  return result;
};



// simple shift
console.log(caesarEncrypt('A', 0));       // "A"
console.log(caesarEncrypt('A', 3));       // "D"

// wrap around
console.log(caesarEncrypt('y', 5));       // "d"
console.log(caesarEncrypt('a', 47));      // "v"

// all letters
console.log(caesarEncrypt('ABCDEFGHIJKLMNOPQRSTUVWXYZ', 25));
// "ZABCDEFGHIJKLMNOPQRSTUVWXY"
console.log(caesarEncrypt('The quick brown fox jumps over the lazy dog!', 5));
// "Ymj vznhp gwtbs ktc ozrux tajw ymj qfed itl!"

// many non-letters
console.log(caesarEncrypt('There are, as you can see, many punctuations. Right?; Wrong?', 2));
// "Vjgtg ctg, cu aqw ecp ugg, ocpa rwpevwcvkqpu. Tkijv?; Ytqpi?"
