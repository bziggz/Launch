const person = {
  name: 'Bob',
  occupation: 'web developer',
  hobbies: 'painting',
};

console.log(person.name);
console.log(person['hobbies']);

// -------------------------------------------------

const myArray = {
  0: 'Frank',
  1: 'Dee',
  2: 'Dennis',
  length: 3,
};

for (let i = 0; i < myArray.length; i += 1) {
  console.log(myArray[i]);
}

// -------------------------------------------------

const obj = {
  b: 2,
  a: 1,
  c: 3,
};

const arr = Object.keys(obj).map((key) => key.toUpperCase());
console.log(arr);
console.log(obj);

// --------------------------------------------------

const myProtoObj = {
  foo: 1,
  bar: 2,
};

const myObj = Object.create(myProtoObj);

myObj.qux = 3;

// --------------------------------------------------

const objToCopy = {
  foo: 1,
  bar: 2,
};

function copyObj(obj7, keysToCopy = []) {
  const result = {};
  if (keysToCopy.length === 0) {
    Object.keys(obj7).forEach((key) => {
      result[key] = obj7[key];
    });
  } else {
    keysToCopy.forEach((key) => {
      result[key] = obj7[key];
    });
  }

  return result;
}

const newObj = copyObj(objToCopy);
console.log(newObj.foo); // => 1
console.log(newObj.bar); // => 2

const newObj2 = copyObj(objToCopy, ['foo']);
console.log(newObj2.foo); // => 1
console.log(newObj2.bar); // => undefined



function copyObj(sourceObject, keys) {
  let destinationObject = {};

  if (keys) {
    keys.forEach(function(key) {
      destinationObject[key] = sourceObject[key];
    });

    return destinationObject;
  } else {
    return Object.assign(destinationObject, sourceObject);
  }
}
