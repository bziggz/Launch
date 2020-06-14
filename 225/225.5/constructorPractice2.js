// 1

let shape = {
  getType() {
    return this.type;
  },
};

function Triangle(a, b, c) {
  this.a = a;
  this.b = b;
  this.c = c;
  this.type = 'triangle';
}

Triangle.prototype = shape;

Triangle.prototype.getPerimeter = function () {
  return this.a + this.b + this.c;
}

Triangle.prototype.constructor = Triangle;

var t = new Triangle(3, 4, 5);
t.constructor;                 // Triangle(a, b, c)
shape.isPrototypeOf(t);        // true
t.getPerimeter();              // 12
t.getType();                   // "triangle"

// 2

function User(first, last) {
  if (!(this instanceof User)) {
    return new User(first, last);
  }

  this.name = `${first} ${last}`;
}

var name = 'Jane Doe';
var user1 = new User('John', 'Doe');
var user2 = User('John', 'Doe');

console.log(name);         // => Jane Doe
console.log(user1.name);   // => John Doe
console.log(user2.name);   // => John Doe

// 3

function createObject(obj) {
  function F() {}
  F.prototype = obj;
  return new F();
}

var foo = {
  a: 1
};

var bar = createObject(foo);
foo.isPrototypeOf(bar);         // true

// 4

Object.prototype.begetObject = function () {
  function F() {}
  F.prototype = this;
  return new F();
}

var foo = {
  a: 1,
};

var bar = foo.begetObject();
foo.isPrototypeOf(bar);         // true

// 5

function neww(constructor, args) {
  const object = Object.create(constructor.prototype);
  const result = constructor.apply(object, args);

  if (typeof result === 'object') return result;

  return object;
}

function Person(firstName, lastName) {
  this.firstName = firstName;
  this.lastName = lastName;
}

Person.prototype.greeting = function() {
  console.log('Hello, ' + this.firstName + ' ' + this.lastName);
};

var john = neww(Person, ['John', 'Doe']);
john.greeting();          // => Hello, John Doe
john.constructor;         // Person(firstName, lastName) {...}


