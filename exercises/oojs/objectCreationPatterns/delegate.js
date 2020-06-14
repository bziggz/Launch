function delegate (...args) {
  const method = args[1];

  return function() {
    if (args.length > 2) {
      return args[0][method].apply(args[0], args.slice(2));
    } 

    return args[0][method].call(args[0]);
  };
};

var foo = {
  name: 'test',
  bar: function(greeting) {
    console.log(greeting + ' ' + this.name);
  },
};

var baz = {
  qux: delegate(foo, 'bar', 'hello'),
};

baz.qux();   // logs 'hello test';

foo.bar = function() { console.log('changed'); };

baz.qux();          // logs 'changed'