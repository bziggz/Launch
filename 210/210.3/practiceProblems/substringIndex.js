const testString = (str, testStr, startIdx) => {
  let result = true;

  for (let i = startIdx, j = 0; j < testStr.length; i += 1, j += 1) {
    if (str[i] !== testStr[j]) {
      result = false;
    }
  }

  return result;
};

const indexOf = (str, testStr) => {
  const testLength = testStr.length;
  let result = -1;

  for (let i = 0; i <= str.length - testLength; i += 1) {
    if (str[i] === testStr[0] && testString(str, testStr, i)) {
      result = i;
      break;
    }
  }

  console.log(result);
};

const lastIndexOf = (str, testStr) => {
  let result = -1;

  for (let i = str.length; i >= 0; i -= 1) {
    if (str[i] === testStr[0] && testString(str, testStr, i)) {
      result = i;
      break;
    }
  }

  console.log(result);
};

lastIndexOf('Some strings', 's'); // 11
lastIndexOf('Blue Whale, Killer Whale', 'Whale'); // 19
lastIndexOf('Blue Whale, Killer Whale', 'all'); // -1

indexOf('Some strings', 's'); // 5
indexOf('Blue Whale', 'Whale'); // 5
indexOf('Blue Whale', 'Blute'); // -1
indexOf('Blue Whale', 'leB'); // -1
