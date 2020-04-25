// Write a function that displays an 8-pointed star in an nxn grid,
// where n is an odd integer that is supplied as an argument to the function.
// The smallest such star you need to handle is a 7x7 grid (i.e., when n is 7).

// input - an odd number n - dimensions for an eight-pointed star - at least 7
// output = an eight-pointed star n X n

// ALGORITHM -

//   every other row -
//     * spaces * spaces *

//     spaces start at (n - 3) / 2
//     decreases to 0

//   one center row -
//     '*'.repeat(n)

//   bottom row starts at 0 - increase to (n -3) / 2

const star = (n) => {
  const centerRow = '*'.repeat(n);
  const space = (count) => ' '.repeat(count);
  const spaceMax = (n - 3) / 2;

  let leadSpaces = 0;

  for (let midSpaces = spaceMax; midSpaces >= 0; midSpaces -= 1) {
    console.log(`${space(leadSpaces)}*${space(midSpaces)}*${space(midSpaces)}*`);
    leadSpaces += 1;
  }

  console.log(centerRow);
  leadSpaces -= 1;

  for (let midSpaces = 0; midSpaces <= spaceMax; midSpaces += 1) {
    console.log(`${space(leadSpaces)}*${space(midSpaces)}*${space(midSpaces)}*`);
    leadSpaces -= 1;
  }
};


// Examples:

star(7);

// logs
// *  *  *
//  * * *
//   ***
// *******
//   ***
//  * * *
// *  *  *

star(9);

// logs
// *   *   *
//  *  *  *
//   * * *
//    ***
// *********
//    ***
//   * * *
//  *  *  *
// *   *   *
