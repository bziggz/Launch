// SOURCE:

// EXTRACT PROBLEM

// INPUT
//   two strings - version numbers, decimal-seperated \d+(.\d+)*.\d

// EXAMPLE

// OUTPUT
//   an integer - 1, -1, 0, null
//     if version1 > version2 - 1
//     if version1 < version2 - -1
//     if equal  - 0
//     if invalid - null

// EXPERIMENT / EDGE

// ALGO
  //  validate both arguments and return null if invalid or missing
  //  split version strings by '.' and put in to an array - map into numbers
  //  make shortest array same length as longest array
    //  change undefined to 0 for comparison

  //  loop through both arrays, comparing numbers at same index
  //  if equal, continue loop. 
    //  if unequal, evaluate difference
  // return 0 if loop completes

const compareVersions = (version1 = '', version2 = '') => {
  if (!(/^\d+(\.\d+)*$/.test(version1))
    || !(/^\d+(\.\d+)*$/.test(version2))) return null;

  const version1Array = version1.split('.').map((digits) => parseInt(digits, 10));
  const version2Array = version2.split('.').map((digits) => parseInt(digits, 10));

  if (version1Array.length > version2Array.length) {
    for (let i = version2Array.length; i < version1Array.length; i += 1) {
      version2Array.push(0);
    }
  } else if (version2Array.length > version1Array.length) {
    for (let i = version1Array.length; i < version2Array.length; i += 1) {
      version1Array.push(0);
    }
  }

  for (let i = 0; i < version1Array.length; i += 1) {
    if (version1Array[i] > version2Array[i]) return 1;
    if (version2Array[i] > version1Array[i]) return -1;
  }

  return 0;
};

// LS Test Cases

console.log(compareVersions('1', '1'));            // 0
console.log(compareVersions('1.1', '1.0'));        // 1
console.log(compareVersions('2.3.4', '2.3.5'));    // -1
console.log(compareVersions('1.a', '1'));          // null
console.log(compareVersions('.1', '1'));           // null
console.log(compareVersions('1.', '2'));           // null
console.log(compareVersions('1..0', '2.0'));       // null
console.log(compareVersions('1.0', '1.0.0'));      // 0
console.log(compareVersions('1.0.0', '1.1'));      // -1
console.log(compareVersions('1.0', '1.0.5'));      // -1
console.log('\n');

// BZ TEST CASES

  // HAPPY PATHS:

console.log(compareVersions('13.37', '1.18.2')); // 1
console.log(compareVersions('1.2', '1.3')); // -1
console.log(compareVersions('0.1', '1.0')); // -1
console.log(compareVersions('1.1.1.2', '1.1.1.1')) // 1
console.log(compareVersions('1.1.1.1', '1.1.2.1')) // -1
console.log(compareVersions('4.5.6.7', '4.5.6.7')) // 0

  // EDGE:
    // EMPTY:

console.log(compareVersions('', '1.0')); // null
console.log(compareVersions('1.0')); // null


    // BOUNDARY:

console.log(compareVersions('1.2', '1.2.0.0')) // 0

    // DUPLICATES:
    // CASE:
    // DATA TYPE:

  // FAILURE:
    // EXCEPTION/ERROR:
    // SPECIAL VALUES:
