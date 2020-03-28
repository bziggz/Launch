const substring = (string, start, end = string.length) => {
  let result = '';
  let first = (start > 0) ? start : 0;
  let last = (end > 0) ? end : 0;

  [first, last] = (first < last) ? [first, last] : [last, first];

  last = (last > string.length) ? string.length : last;

  for (let i = first; i < last; i += 1) {
    result += string[i];
  }

  console.log(result);
};

const string = 'hello world';

substring(string, 2, 4); // "ll"
substring(string, 4, 2); // "ll"
substring(string, 0, -1); // ""
substring(string, 2); // "llo world"
substring(string, 'a'); // "hello world"
substring(string, 8, 20); // "rld"
