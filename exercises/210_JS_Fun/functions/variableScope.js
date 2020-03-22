function someFunction() {
  myVar = 'This is global';
}

someFunction();
console.log(myVar);

/* logs This is global, since myVar is initialized without declaration,
making it a global variable*/
