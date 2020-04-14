// input: a word and an array
// output: an array of anagram words
// algo:

//   copy the array and the word
//   sort the copy word and map sort copy array words
//   filter original array by if sorted word matches sorted test word

const sorted = (word) => word.split('').sort().join('');

function anagram(word, list) {
  return list.filter((listWord) => sorted(listWord) === sorted(word));
}

console.log(anagram('listen', ['enlists', 'google', 'inlets', 'banana'])); // [ "inlets" ]
console.log(anagram('listen', ['enlist', 'google', 'inlets', 'banana'])); // [ "enlist", "inlets" ]
