const twice = (integer) => {
  const stringInt = String(integer);
  const testStr1 = stringInt.slice(0, stringInt.length / 2);
  const testStr2 = stringInt.slice(stringInt.length / 2);

  return testStr1 === testStr2 ? integer : integer * 2;
};

console.log(twice(37)); // 74
console.log(twice(44)); // 44
console.log(twice(334433)); // 668866
console.log(twice(444)); // 888
console.log(twice(107)); // 214
console.log(twice(103103)); // 103103
console.log(twice(3333)); // 3333
console.log(twice(7676)); // 7676
