// 1

var foo = {};
var bar = Object.create(foo);

foo.a = 1;

console.log(bar.a);

// will log 1

// 2

var foo = {};
var bar = Object.create(foo);

foo.a = 1;
bar.a = 2;
console.log(bar.a);

// will log 2

// 3

var boo = {};
boo.myProp = 1;

var far = Object.create(boo);

// lots of code

far.myProp;       // 1

// to know if myProp is owned by far, we need to call far.hasOwnProperty('myProp');

// 1

function getDefiningObject(object, propKey) {
  do {
    if (object.hasOwnProperty(`${propKey}`)) return object;

    object = Object.getPrototypeOf(object);
  } while (object !== null);

  return null;
}

var foo = {
  a: 1,
  b: 2,
};

var bar = Object.create(foo);
var baz = Object.create(bar);
var qux = Object.create(baz);

bar.c = 3;

console.log(getDefiningObject(qux, 'c') === bar);     // => true
console.log(getDefiningObject(qux, 'e'));             // => null

// 2

function shallowCopy(object) {
  const result = Object.create(Object.getPrototypeOf(object));

  Object.getOwnPropertyNames(object).forEach((prop) =>
    result[prop] = object[prop]);

  return result;
}

var foo = {
  a: 1,
  b: 2,
};

var bar = Object.create(foo);
bar.c = 3;
bar.say = function() {
  console.log('c is ' + this.c);
};

var baz = shallowCopy(bar);
console.log(baz.a);       // => 1
baz.say();                // => c is 3
baz.hasOwnProperty('a');  // false
baz.hasOwnProperty('b');  // false

// 3

function extend(destination) {
  for (let i = 1; i < arguments.length; i += 1) {
    Object.getOwnPropertyNames(arguments[i]).forEach((prop) =>
      destination[prop] = arguments[i][prop];
  }

  return destination;
}

var foo = {
  a: 0,
  b: {
    x: 1,
    y: 2,
  },
};

var joe = {
  name: 'Joe'
};

var funcs = {
  sayHello: function() {
    console.log('Hello, ' + this.name);
  },

  sayGoodBye: function() {
    console.log('Goodbye, ' + this.name);
  },
};

var object = extend({}, foo, joe, funcs);

console.log(object.b.x);          // => 1
object.sayHello();                // => Hello, Joe
