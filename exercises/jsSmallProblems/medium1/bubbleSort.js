const bubbleSort = (array) => {
  let swapped;

  do {
    swapped = false;
    for (let i = 1; i < array.length; i += 1) {
      if (array[i - 1] > array[i]) {
        [array[i], array[i - 1]] = [array[i - 1], array[i]];

        swapped = true;
      }
    }

    if (swapped === false) break;
  } while (true);
};

const array = [5, 3];
bubbleSort(array);
console.log(array); // [3, 5]

const array1 = [6, 2, 7, 1, 4];
bubbleSort(array1);
console.log(array1); // [1, 2, 4, 6, 7]

const array2 = ['Sue', 'Pete', 'Alice', 'Tyler', 'Rachel', 'Kim', 'Bonnie'];
bubbleSort(array2);
console.log(array2); // ["Alice", "Bonnie", "Kim", "Pete", "Rachel", "Sue", "Tyler"]
