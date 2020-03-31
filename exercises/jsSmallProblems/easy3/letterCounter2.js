const wordSizes = (string) => {
  const result = {};
  if (string.trim().length === 0) return {};

  const lengths = string.split(' ').map((word) => word.replace(/[^a-z]/gi, '').length);

  for (let i = 0; i < lengths.length; i += 1) {
    result[lengths[i]] = result[lengths[i]] || 0;
    result[lengths[i]] += 1;
  }

  return result;
};

console.log(wordSizes('Four score and seven.')); // { "3": 1, "4": 1, "5": 2 }
console.log(wordSizes('Hey diddle diddle, the cat and the fiddle!')); // { "3": 5, "6": 3 }
console.log(wordSizes("What's up doc?")); // { "5": 1, "2": 1, "3": 1 }
console.log(wordSizes('')); // {}
