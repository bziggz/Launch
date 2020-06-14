// 1

var a = 1;
var foo;
var obj;

function Foo() {
  this.a = 2;
  this.bar = function() {
    console.log(this.a);
  };
  this.bar();
}

foo = new Foo(); // logs 2

foo.bar(); // logs 2
Foo(); // logs 2 and changes global.a to 2

obj = {};
Foo.call(obj); // logs 2
obj.bar(); // logs 2

console.log(this.a); // logs 2

// 2

var RECTANGLE = {
  area: function() {
    return this.width * this.height;
  },
  perimeter: function() {
    return 2 * (this.width + this.height);
  },
};

function Rectangle(width, height) {
  this.width = width;
  this.height = height;
  this.area = RECTANGLE.area();
  this.perimeter = RECTANGLE.perimeter();
}

var rect1 = new Rectangle(2, 3);
console.log(rect1.area); // logs NaN
console.log(rect1.perimeter); // logs NaN

// to fix

var RECTANGLE = {
  area: function() {
    return this.width * this.height;
  },
  perimeter: function() {
    return 2 * (this.width + this.height);
  },
};

function Rectangle(width, height) {
  this.width = width;
  this.height = height;
  this.area = RECTANGLE.area.call(this);
  this.perimeter = RECTANGLE.perimeter.call(this);
}

var rect1 = new Rectangle(2, 3);
console.log(rect1.area); // logs NaN
console.log(rect1.perimeter); // logs NaN

// 3

function Circle(radius) {
  this.radius = radius;
}

Circle.prototype.area = function () {
  return Math.PI * (this.radius ** 2);
}

var a = new Circle(3);
var b = new Circle(4);

console.log(a.area().toFixed(2)); // => 28.27
console.log(b.area().toFixed(2)); // => 50.27

// 4

var ninja;
function Ninja() {
  this.swung = true;
}

ninja = new Ninja();

Ninja.prototype.swingSword = function() {
  return this.swung;
};

console.log(ninja.swingSword());

// will log true

// 5

var ninja;
function Ninja() {
  this.swung = true;
}

ninja = new Ninja();

Ninja.prototype = {
  swingSword: function() {
    return this.swung;
  },
};

console.log(ninja.swingSword());

// will log TypeError, Ninja.prototype is reassigned a different object

// 6

var ninjaA;
var ninjaB;
function Ninja() {
  this.swung = false;
}

ninjaA = new Ninja();
ninjaB = new Ninja();

// Add a swing method to the Ninja prototype which
// returns the calling object and modifies swung

Ninja.prototype.swing = function () {
  this.swung = true;

  return this;
}

console.log(ninjaA.swing().swung);      // must log true
console.log(ninjaB.swing().swung);      // must log true

// 7

var ninjaA = (function() {
  function Ninja(){};
  return new Ninja();
})();

ninjaB = new ninjaA.constructor;

console.log(ninjaB.constructor === ninjaA.constructor);    // should log true

