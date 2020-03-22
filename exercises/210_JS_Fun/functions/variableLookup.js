var myVar = 'This is global';

function someFunction() {
  console.log(myVar);
}

someFunction();

/* logs This is global. as the global variables are accessible locally */