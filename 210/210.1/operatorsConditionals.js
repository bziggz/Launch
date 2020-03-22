// 1

let apples = 3;
let bananas = 5;

if (apples == bananas) {
  console.log('You have the same number of apples and bananas.');
}

// 2

bananas = '3';

if (apples == bananas) {
  console.log('You have the same number of apples and string bananas.');
}

// 3

if (apples === bananas) {
  console.log('You have the same number of apples and string bananas.');
} // doesn't work due to differing types

// 4

if (apples === bananas) {
  console.log('You have the same number of apples and string bananas.');
} else {
  console.log('You have a different amount of apples and bananas.'
    + 'Or the wrong kind of bananas.');
}

// 5

if (apples === bananas) {
  console.log('You have the same number of apples and string bananas.');
} else if (apples == bananas) {
  console.log('You have the same number of apples and bananas, but '
    + 'the wrong type of bananas.');
} else {
  console.log('You have a different amount of apples and bananas.'
    + 'Or the wrong kind of bananas.');
}

// 6

if (apples === bananas) {
  console.log('You have the same number of apples and string bananas.');
} else {
  if (apples == bananas) {
  console.log('You have the same number of apples and bananas, but '
    + 'the wrong type of bananas.');
} else {
  console.log('You have a different amount of apples and bananas.'
    + 'Or the wrong kind of bananas.');
}
}

// 7

apples = 3;
bananas = 3;

const areEqual = apples === bananas;

console.log(areEqual);

// 8

apples = 3;
bananas = undefined;

let eitherOr = apples || bananas;

console.log(eitherOr);

// 9

apples = 3;
bananas = 1;

eitherOr = apples || bananas;

console.log(eitherOr);

eitherOr = bananas || apples;

console.log(eitherOr);

// 10

const lastName = 'Zelinski';

const familyMessage = lastName === 'Zelinski' ? 'You\'re part of the family!'
  : 'You\'re not family!';

console.log(familyMessage);
