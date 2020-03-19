function evenOrOdd(num) {
  if (!Number.isInteger(num)) {
    return console.log('Must enter a whole number.');
  }

  if (num % 2 === 0) {
    console.log('even');
  } else {
    console.log('odd');
  }
}

evenOrOdd(2.5);
