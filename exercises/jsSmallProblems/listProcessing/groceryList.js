const buyFruit = (array) => array.flatMap((fruit) => (
  [...Array(fruit[1])].map(() => fruit[0])
));

console.log(buyFruit([['apple', 3], ['orange', 1], ['banana', 2]]));
// returns ["apple", "apple", "apple", "orange", "banana", "banana"]
