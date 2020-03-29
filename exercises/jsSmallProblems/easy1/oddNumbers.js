for (let i = 1; i <= 99; i += 2) console.log(i);

const oddLogger = (start, end) => {
  let i = start;

  do {
    if (i % 2 === 1) console.log(i);
    i += 1;
  } while (i <= end);
};
