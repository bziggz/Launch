// 1

var prot = {};

var foo = Object.create(prot);

// 2

console.log(Object.getPrototypeOf(foo) === prot);

// 3 

console.log(prot.isPrototypeOf(foo));

// 4

prot.isPrototypeOf(foo); 
Object.prototype.isPrototypeOf(foo);

// both will output true. since both lie on the prototype chain of foo