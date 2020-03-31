const makeString = (integer, char) => {
  let result = '';
  for (let i = 1; i <= integer; i += 1) result += char;

  return result;
};

const triangle = (integer) => {
  for (let stars = 1; stars <= integer; stars += 1) {
    const spaces = integer - stars;
    console.log(makeString(spaces, ' ') + makeString(stars, '*'));
  }
};

triangle(5);

triangle(9);
