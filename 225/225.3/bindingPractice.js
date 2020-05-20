// 1

// Function.prototype.bind(context) is used to permanently bind a function to a context

// 2

var obj = {
  message: 'JavaScript',
};

function foo() {
  console.log(this.message);
}

foo.bind(obj);

// will output nothing, since it's not a function invocation

// 3

var a = 1;
var b = -1;
var obj = {
  a: 2,
  b: 3,
};

function foo() {
  return this.a + this.b;
}

var bar = foo.bind(obj);

console.log(foo());
console.log(bar());

// will output 0, 5

// 4

var positiveMentality = {
  message: 'JavaScript makes sense!',
};

var negativeMentality = {
  message: 'JavaScript makes no sense!',
};

function foo() {
  console.log(this.message);
}

var bar = foo.bind(positiveMentality);

negativeMentality.logMessage = bar;
negativeMentality.logMessage();

// 'JavaScript makes sense'

// 5

var obj = {
  a: 'Amazebulous!',
};
var otherObj = {
  a: "That's not a real word!",
};

function foo() {
  console.log(this.a);
}

var bar = foo.bind(obj);

bar.call(otherObj);

// will output 'Amazebulous!' - since bind can't be altered.
