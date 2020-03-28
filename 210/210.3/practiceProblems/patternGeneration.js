const generatePattern = (int) => {
  let boxSize = 0;
  for (let i = 1; i <= int; i += 1) boxSize += String(i).length;

  let numString = '';

  for (let i = 1; i <= int; i += 1) {
    numString += i;

    let asterisks = '';

    for (let j = (boxSize - numString.length); j > 0; j -= 1) {
      asterisks += ('*');
    }

    console.log(`${numString}${asterisks}`);
  }
};

generatePattern(20);
