const isBalanced = (string) => {
  let parenCount = 0;
  const testString = string.replace(/[^()]/g, '');

  for (let i = 0; i < testString.length; i += 1) {
    parenCount += (/\(/).test(testString[i]) ? 1 : -1;
    if (parenCount < 0) return false;
  }

  return parenCount === 0;
};

console.log(isBalanced('What (is) this?')); // true
console.log(isBalanced('What is) this?')); // false
console.log(isBalanced('What (is this?')); // false
console.log(isBalanced('((What) (is this))?')); // true
console.log(isBalanced('((What)) (is this))?')); // false
console.log(isBalanced('Hey!')); // true
console.log(isBalanced(')Hey!(')); // false
console.log(isBalanced('What ((is))) up(')); // false
