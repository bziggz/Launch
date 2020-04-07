const vehicles = ['car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'];

const countOccurrences = (arr) => {
  const result = {};

  arr.forEach((vehicle) => {
    result[vehicle] = result[vehicle] + 1 || 1;
  });

  Object.keys(result)
    .forEach((vehicle) => console.log(`${vehicle} => ${result[vehicle]}`));

  return result;
};

countOccurrences(vehicles);

/* console output
car => 4
truck => 3
SUV => 1
motorcycle => 2
*/
