// Write a function that displays a four-pointed diamond in an nxn grid, where n is an odd integer supplied as an argument to the function. You may assume that the argument will always be an odd integer.

// INPUT - an odd number n - four-pointed diamond dimension
// OUTPUT - a diamond of '*' with n rows and n '*' at its longest

// ALGORITHM - 
//   row 1 = ' ' * 4 + '*' * 1
//   row 2 = ' ' * 3 + '*' * 3
//   row 3 = ' ' * 2 + '*' * 5
//   row 4 = ' ' * 1 + '*' * 7
//   row 5 =           '*' * 9
//   row 6 = ' ' * 1 + '*' * 7
//   row 7 = ' ' * 2 + '*' * 5
//   row 8 = ' ' * 3 + '*' * 3
//   row 9 = ' ' * 4 + '*' * 1

// initial ' ' = floor(n / 2) - increment -= 1 till 0, then += 1 till initial
// initial '*' = 1 += 2 till n, then -= 2 till 1

// loop through, with initialSpace and initialStar
//   log combined row
//   increment (n / 2).ceil times, then decrement 

const diamond = (n) => {
  let numSpaces = Math.ceil(n / 2);
  
  for (let numStars = 1; numStars <= n; numStars += 2) {
    numSpaces -= 1;
    
    console.log(`${' '.repeat(numSpaces)}${'*'.repeat(numStars)}`);
  }
  
  for (let numStars = n - 2; numStars >= 1; numStars -= 2) {     
    numSpaces += 1; 
    
    console.log(`${' '.repeat(numSpaces)}${'*'.repeat(numStars)}`);
  }
};

const hollowDiamond = (n) => {
  let leadSpaces = Math.ceil(n / 2);
  let innerSpaces = 1;
  
  const endRow = `${' '.repeat(leadSpaces)}${'*'}`;

  console.log(endRow);
  
  for (let numStars = 1; numStars <= n; numStars += 2) {
    leadSpaces -= 1;
    
    console.log(`${' '.repeat(leadSpaces)}*${' '.repeat(innerSpaces)}*`);
    
    innerSpaces += 2;
  }
  
  innerSpaces -= 2;
  
  for (let numStars = n - 2; numStars >= 1; numStars -= 2) {     
    leadSpaces += 1; 
    innerSpaces -= 2;
    
    console.log(`${' '.repeat(leadSpaces)}*${' '.repeat(innerSpaces)}*`);
  }
  
  console.log(endRow);
};

hollowDiamond(9);

// Examples:

diamond(1);
// logs
// *
diamond(3);
// logs
//  *
// ***
//  *
diamond(9);
// logs
//     *
//    ***
//   *****
//  *******
// *********
//  *******
//   *****
//    ***
//     *


