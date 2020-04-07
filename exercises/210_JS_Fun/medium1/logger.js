function debugIt() {
  var status = 'debugging';
  function logger() {
    console.log(status);
  }

  logger();
}

debugIt();

/* will log 'debugging' because by the time logger() is called on line 7, 
sttaus  has been assigned to 'debugging' */