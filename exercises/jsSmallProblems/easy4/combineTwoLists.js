const interleave = (arr1, arr2) => {
  const result =[];
  for (let i = 0; i < arr1.length; i += 1) {
    result.push(arr1[i]);
    result.push(arr2[i]);
  }

  return result;
}

console.log(interleave([1, 2, 3], ['a', 'b', 'c'])); // [1, "a", 2, "b", 3, "c"]
