var myObject = {
  prop1: '123',
  prop2: '234',
  'prop 3': '345',
};

var prop2 = '456';
myObject['prop2'] = '456';
myObject[prop2] = '678';

console.log(myObject[prop2]);
console.log(myObject.prop2);

console.log(Object.getOwnPropertyDescriptors(myObject));

// prop2 carries the value '456', which becomes the new key in myObject


var myObj = {};
myObj[myFunc()] = 'hello, ';

function myFunc() {
  return 'funcProp';
}

console.log(myObj);
myObj[myFunc()] = 'world!';
console.log(myObj);

// since myFunc returns 'funcprop', and is called in the bracket, 
// the property 'funcprop' is defined in myObj