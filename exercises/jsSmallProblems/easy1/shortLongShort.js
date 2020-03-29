const shortLongShort = (string1, string2) => {
  const [short, long] = string1.length < string2.length
    ? [string1, string2] : [string2, string1];

  return short + long + short;
};

shortLongShort('abc', 'defgh'); // "abcdefghabc"
shortLongShort('abcde', 'fgh'); // "fghabcdefgh"
shortLongShort('', 'xyz'); // "xyz"
