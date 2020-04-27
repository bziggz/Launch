const featured = (num) => {
  let firstPossible = num + 7 - (num % 7);
  if (firstPossible % 2 === 0) firstPossible += 7;

  for (let i = firstPossible; i <= 9876543201; i += 14) {
    if ([...new Set(String(i))].join('') === [...String(i)].join('')) return i;
  }

  return 'No Higher Featured Number.';
};

console.log(featured(12)); // 21
console.log(featured(20)); // 21
console.log(featured(21)); // 35
console.log(featured(997)); // 1029
console.log(featured(1029)); // 1043
console.log(featured(999999)); // 1023547
console.log(featured(999999987)); // 1023456987
