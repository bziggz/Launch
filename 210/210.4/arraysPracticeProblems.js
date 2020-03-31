// 1

const lastInArray = (array) => array[array.length - 1];

// 2

const rollCall = (nameArray) => {
  for (let i = 0; i < nameArray.length; i += 1) console.log(nameArray[i]);
};

// 3

const reversed = (array) => {
  const result = [];
  const lastIndex = array.length - 1;

  for (let i = lastIndex; i >= 0; i -= 1) result.push(array[i]);

  return result;
};

// 4

const findValue = (array, value) => {
  let result = -1;

  for (let i = 0; i < array.length; i += 1) {
    if (array[i] === value) {
      result = i;
      break;
    }
  }

  return result;
};

// 5

const combinedValues = (array) => {
  let result = '';

  for (let i = 0; i < array.length; i += 1) {
    result += String(array[i]);
  }

  return result;
};
