const centerOf = (string) => {
  const half = string.length / 2;

  if (string.length % 2 === 0) return string.slice(half - 1, half + 1);

  return string.slice(half, half + 1);
};


console.log(centerOf('I Love JavaScript')); // "a"
console.log(centerOf('Launch School')); // " "
console.log(centerOf('Launch')); // "un"
console.log(centerOf('Launchschool')); // "hs"
console.log(centerOf('x')); // "x"
