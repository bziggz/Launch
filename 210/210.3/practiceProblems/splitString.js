const splitString = (str, delimiter) => {
  if (delimiter === '') {
    for (let i = 0; i < str.length; i += 1) console.log(str[i]);
    return;
  }

  if (!delimiter) {
    console.log('ERROR: No delimiter');
    return;
  }

  let result = '';

  for (let i = 0; i < str.length; i += 1) {
    if (str[i] === delimiter) {
      console.log(result);
      result = '';
    } else {
      result += str[i];
    }
  }

  if (result) console.log(result);
};

splitString('abc,123,hello world', ',');
// logs:
// abc
// 123
// hello world

// splitString('hello');
// logs:
// ERROR: No delimiter

// splitString('hello', '');
// logs:
// h
// e
// l
// l
// o

// splitString('hello', ';');
// logs:
// hello

splitString(';hello;', ';');
// logs:
//  (this is a blank line)
// hello