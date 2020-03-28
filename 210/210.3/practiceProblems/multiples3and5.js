const mults = function multiplesOfThreeAndFive() {
  for (let i = 3; i <= 100; i += 1) {
    if (i % 3 === 0 && i % 5 === 0) {
      console.log(`${i}!`);
    } else if (i % 3 === 0 || i % 5 === 0) {
      console.log(`${i}`);
    }
  }
};

mults();

// FE

const multsWithArgs = function multiplesOfThreeAndFive(num) {
  for (let i = 3; i <= num; i += 1) {
    if (i % 3 === 0 && i % 5 === 0) {
      console.log(`${i}!`);
    } else if (i % 3 === 0 || i % 5 === 0) {
      console.log(`${i}`);
    }
  }
};

multsWithArgs(70);
