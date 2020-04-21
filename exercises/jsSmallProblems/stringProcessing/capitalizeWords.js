const wordCap = (string) => {
  const toLower = (char) => char.toLowerCase();
  const toUpper = (char) => char.toUpperCase();

  return string.replace(/^.|\s\S/gi, toUpper).replace(/\B\S+/g, toLower);
};

console.log(wordCap('four score and seven')); // "Four Score And Seven"
console.log(wordCap('the javaScript language')); // "The Javascript Language"
console.log(wordCap('this is a "quoted" word')); // 'This Is A "quoted" Word'
