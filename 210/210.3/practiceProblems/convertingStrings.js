// var string = 'A';
// asciiNumeric = string.charCodeAt(0);         // 65
// asciiNumeric += 32;
// string = String.fromCharCode(asciiNumeric);  // "a", converted to lowercase
// 65-90

const toLowerCase = (string) => {
  let result = '';

  for (let i = 0; i < string.length; i += 1) {
    let ascii = string.charCodeAt(i);
    if (ascii >= 65 && ascii <= 90) {
      ascii += 32;
      result += String.fromCharCode(ascii);
    } else {
      result += string[i];
    }
  }

  console.log(result);
};

toLowerCase('ALPHABET'); // "alphabet"
toLowerCase('123'); // "123"
toLowerCase('abcDEF'); // "abcdef
