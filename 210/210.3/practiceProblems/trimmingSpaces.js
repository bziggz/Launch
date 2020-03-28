const trimLeft = (str) => {
  for (let i = 0; i <= str.length; i += 1) {
    if (str[i] !== ' ') return i;
  }

  return str.length;
};

const trimRight = (str) => {
  for (let i = str.length - 1; i >= 0; i -= 1) {
    if (str[i] !== ' ') return i;
  }

  return 0;
};

const trim = (str) => {
  let result = '';
  const start = trimLeft(str);
  const end = trimRight(str);

  if (start >= end) return result;

  for (let i = start; i <= end; i += 1) {
    result += str[i];
  }


  return result;
};

trim('  abc  '); // "abc"
trim('abc   '); // "abc"
trim(' ab c'); // "ab c"
trim(' a b  c'); // "a b  c"
trim('      '); // ""
trim(''); // ""
