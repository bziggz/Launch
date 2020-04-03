// literal

var myObject = {
  a: 'name',
  'b': 'test',
  123: 'c',
  1: 'd',
};

myObject[1];
myObject[a];
myObject.a;

// Lines 8 and 9 should be using strings inside the bracket. JS
// takes care of the num on line 8 using implicit conversion

// literal method

var person = {
  firstName: function () {
    return 'Victor';
  },
  lastName: function () {
    return 'Reyes';
  },
};

console.log(person.firstName + ' ' + person.lastName;

// returns the functions themselves. To fix, add () after the two
// function calls

