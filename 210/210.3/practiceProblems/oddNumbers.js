const odds = function logOddNumbers(num) {
  for (let i = 1; i <= num; i += 2) {
    console.log(i);
  }
};

odds(19);

// FE

const oddsCond = function logOddNumbersIfOdd(num) {
  for (let i = 1; i <= num; i += 1) {
    if (i % 2 === 1) console.log(i);
  }
};

oddsCond(23);

const skipEvens = function logOddNumbersUnlessEven(num) {
  for (let i = 1; i <= num; i += 1) {
    if (i % 2 === 0) continue;

    console.log(i);
  }
};

skipEvens(15);
