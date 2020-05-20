// 1.1

function whatIsMyContext() {
  return this;
}

// this is unknown

// 1.2

function whatIsMyContext() {
  return this;
}

whatIsMyContext();

// this is global, or the window

// 1.3

function foo() {
  function bar() {
    function baz() {
      console.log(this);
    }

    baz();
  }

  bar();
}

foo();

// this is global/window

// 1.4

var obj = {
  count: 2,
  method: function() {
    return this.count;
  },
};

obj.method();

// this is obj

// 1.5

function foo() {
  console.log(this.a);
}

var a = 2;
foo();

// will log 2, since both a and foo are in the global conxtext

// 1.6

var a = 1;
function bar() {
  console.log(this.a);
}

var obj = {
  a: 2,
  foo: bar,
};

obj.foo();

// will log 2, since obj owns foo, therefore bar

// 1.7

var foo = {
  a: 1,
  bar: function() {
    console.log(this.baz());
  },

  baz: function() {
    return this;
  },
};

foo.bar();
var qux = foo.bar;
qux();

// will log foo, then undefined, since baz isn't in the window object

// 2.1

var myObject = {
  count: 1,
  myChildObject: {
    myMethod: function() {
      return this.count;
    },
  },
};

myObject.myChildObject.myMethod();

// this is myChildObject, and 107 will return undefined

// 2.2

var myObject = {
  count: 1,
  myChildObject: {
    myMethod: function() {
      return this.count;
    },
  },
};

myObject.myChildObject.myMethod.call(myObject);

// 2.3

var person = {
  firstName: 'Peter',
  lastName: 'Parker',
  fullName: function() {
    console.log(this.firstName + ' ' + this.lastName +
                ' is the Amazing Spiderman!');
  },
};

var whoIsSpiderman = person.fullName.bind(person);
whoIsSpiderman();

// will log Peter PArker is the Amazing Spiderman!

// 2.4

var a = 1;
var obj = {
  a: 2,
  func: function() {
    console.log(this.a);
  },
};

obj.func();           // 2
obj.func.call();      // 1
obj.func.call(this);  // 1
obj.func(obj);        // 2

var obj2 = { a: 3 };
obj.func.call(obj2);  // 3

// will log above     ^^

// 2.5

var computer = {
  price: 30000,
  shipping: 2000,
  total: function() {
    var tax = 3000;
    var self = this;
    function specialDiscount() {
      if (self.price > 20000) {
        return 1000;
      } else {
        return 0;
      }
    }

    return this.price + this.shipping + tax - specialDiscount();
  }
};

console.log(computer.total());

// will log undefined

