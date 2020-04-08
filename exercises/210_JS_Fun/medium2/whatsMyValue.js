var array = ['Apples', 'Peaches', 'Grapes'];

array[3.4] = 'Oranges';
console.log(array.length); // will log 3 - indices only
console.log(Object.keys(array).length); // will log 4 - all keys

array[-2] = 'Watermelon';
console.log(array.length); // will log 3 - indices only
console.log(Object.keys(array).length); // will log 5 - all keys