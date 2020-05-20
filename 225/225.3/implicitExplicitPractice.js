// 1

function func() {
  return this;
}

var context = func();

console.log(context);

// will output the window object

// 2

var o = {
  func: function() {
    return this;
  },
};

var context = o.func();

console.log(context);

// outputs object o - since the object o's context is assigned on line 21

// 3

var message = 'Hello from the global scope!';

function deliverMessage() {
  console.log(this.message);
}

deliverMessage();

var foo = {
  message: 'Hello from the function scope!',
};

foo.deliverMessage = deliverMessage;

foo.deliverMessage();

// 'Hello from the global scope' - line 35 calls deliverMessage from the window object
// 'Hello from the function scope' - deliverMessage is called by the foo object

// 4

var a = 10;
var b = 10;
var c = {
  a: -10,
  b: -10,
};

function add() {
  return this.a + b;
}

c.add = add;

console.log(add());
console.log(c.add());

// 20 - line 63 references a from the window object
// 0 - line 64 references c.a and window.b

// 5

// call() and apply() let us explicitly state the execution context

// 6

var foo = {
  a: 1,
  b: 2,
};

var bar = {
   a: 'abc',
   b: 'def',
   add: function() {
     return this.a + this.b;
   },
};

bar.add.call(foo) 
// will return 3 - "use the add method from object bar to operate 
// within foo's context"

// 7

var fruitsObj = {
  list: ['Apple', 'Banana', 'Grapefruit', 'Pineapple', 'Orange'],
  title: 'A Collection of Fruit',
};


function outputList() {
  console.log(this.title + ':');

  var args = [].slice.call(arguments);

  args.forEach(function(elem) {
    console.log(elem);
  });
}

outputList.apply(fruitsObj, fruitsObj.list)

// outputList from the window object, fruitsObj as contest, fruitsObj.list as arguments
// use apply since apply gets passee a list

// 8

based on line 103 above, call() is used because the arguments is the context

