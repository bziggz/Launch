const union = (arr1, arr2) => [...new Set([arr1, arr2].flat())];

console.log(union([1, 3, 5], [3, 6, 9])); // [1, 3, 5, 6, 9]
