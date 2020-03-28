const logMultiples = function logMultiples(num) {
  let i = 1;
  let answer;
  const multiples = [];

  do {
    answer = i * num;
    if (answer % 2 === 1) multiples.push(answer);
    i += 1;
  } while (answer <= 100);

  multiples.reverse().forEach((el) => {
    if (el <= 100) console.log(el);
  });
};

logMultiples(17);

logMultiples(21);

// FE using their solution

const log = function logMults(num) {
  let i;
  const max = Math.floor(100 / num) * num;

  for (i = max; i >= num; i -= 1) {
    if (i % 2 === 1 && i % num === 0) {
      console.log(i);
    }
  }
};

log(9);
