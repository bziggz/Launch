// 1

const objectHasProperty = (object, string) => (
  Object.keys(object).includes(string)
);

const pets = {
  cat: 'Simon',
  dog: 'Dwarf',
  mice: null,
};

console.log(objectHasProperty(pets, 'dog')); // true
console.log(objectHasProperty(pets, 'lizard')); // false
console.log(objectHasProperty(pets, 'mice')); // true

// 2

const incrementProperty = (object, string) => {
  if (objectHasProperty(object, string)) {
    object[string] += 1;
  } else {
    object[string] = 1;
  }

  return object[string];
};

const wins = {
  steve: 3,
  susie: 4,
};

console.log(incrementProperty(wins, 'susie')); // 5
console.log(wins); // { steve: 3, susie: 5 }
console.log(incrementProperty(wins, 'lucy')); // 1
console.log(wins); // { steve: 3, susie: 5, lucy: 1 }

// 3

const copyProperties = (obj1, obj2) => {
  let count = 0;
  for (let property in obj1) {
    obj2[property] = obj1[property]
    count += 1
  };

  return count;
};

const hal = {
  model: 9000,
  enabled: true,
};

const sal = {};
console.log(copyProperties(hal, sal)); // 2
console.log(sal); // { model: 9000, enabled: true }

// 4

const wordCount = (string) => {
  const result = {};

  for (let word of string.split(' ')) incrementProperty(result, word);

  return result;
};

console.log(wordCount('box car cat bag box')); // { box: 2, car: 1, cat: 1, bag: 1 }
