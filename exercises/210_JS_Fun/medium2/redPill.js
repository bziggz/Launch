function one() {
  function log(result) {
    console.log(result);
  }

  function anotherOne() {
    var result = '';
    var i;
    for (i = 0; i < arguments.length; i += 1) {
      result += String.fromCharCode(arguments[i]);
    }

    log(result);
  }

  function anotherAnotherOne() {
    console.log(String.fromCharCode(87, 101, 108, 99, 111, 109, 101)); // Welcome
    anotherOne(116, 111); // to
  }

  anotherAnotherOne();
  anotherOne(116, 104, 101); //the
  return anotherOne;
}

one()(77, 97, 116, 114, 105, 120, 33); // Matrix!

/* 

one()
anotherAnotherOne()
anotherOne()
log()
anotherOne()
log()
anotherOne()
log()

*/