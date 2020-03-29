for (let i = 2; i <= 99; i += 2) console.log(i);

const evenLogger = (start, end) => {
  let i = start;

  do {
    if (i % 2 === 0) console.log(i);
    i += 1;
  } while (i <= end);
};