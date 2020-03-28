const substr = (string, start, length) => {
  let result = '';
  if (length <= 0) return result;

  const first = (start < 0) ? (string.length + start) : start;
  const last = (first + length) >= string.length
    ? string.length : (first + length);

  for (let i = first; i < last; i += 1) result += string[i];

  return result;
};

const string = 'hello world';

substr(string, 2, 4); // "llo "
substr(string, -3, 2); // "rl"
substr(string, 8, 20); // "rld"
substr(string, 0, -20); // ""
substr(string, 0, 0); // ""
