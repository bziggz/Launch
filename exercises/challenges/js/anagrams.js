// Write a program that, given a word and a list of possible anagrams,
//  selects the correct sublist that contains the anagrams of the word.

// For example, given the word "listen" and a list of candidates like 
// "enlists" "google" "inlets" "banana" the program should return a list 
// containing "inlets". Please read the test suite for exact rules of anagrams.

// INPUT - a word, a list of possible anagrams
// OUTPUT - a list from possible that are actual - empty if none

// RULES - 
//   an anagram uses all chars
//   case sensitive
//   same word doesn't count

// ALGORITHM - 
//   guard - return [] if string or arr are empty

//   create result arr

//   loop through test arr
//     if word is equal - skip
//     if word length is unequal - skip


//     split -> sort -> join both test and base word - 
//       if equal, push to result

//   return result

const anagrams = (targetWord, wordArr) => {
  if (wordArr.length === 0 || targetWord.length === 0) return [];

  const result = [];
  const sorted = (word) => word.split('').sort().join('');
  const sortedTarget = sorted(targetWord);

  wordArr.forEach((word) => {
    if (word !== targetWord && sorted(word) === sortedTarget) {
      result.push(word);
    }
  });

  return result;
};


// TEST 
  
console.log(anagrams('diaper', ['hello', 'world', 'zombies', 'pants'])); // []
console.log(anagrams('ant', ['tan', 'stand', 'at'])); // tan
console.log(anagrams('master', ['maters', 'stream', 'pigeon'])); // maters, stream
console.log(anagrams('galea', ['eagle'])); // eagle
console.log(anagrams('corn', ['corn', 'dark', 'Corn', 'cron'])); // cron
console.log(anagrams('diaper', [])); // []
console.log(anagrams('', ['hello', 'world', 'zombies', 'pants'])); // []
console.log(anagrams('', [])); // []
console.log(anagrams('diaper', ['hello', 'paidre', '', 'pants'])); // paidre
console.log(anagrams('Master', ['Maters', 'stream', 'pigeon'])); // maters
// console.log(anagrams('diaper', ['hello', 'world', 'zombies', 'pants']));

