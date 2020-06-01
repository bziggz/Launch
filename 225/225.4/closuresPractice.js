// 1

function makeCounterLogger(num1) {
  return function (num2) {
    if (num1 >= num2) {
      for (let i = num1; i >= num2; i -= 1) {
        console.log(i);
      }
    } else {
      for (let i = num1; i <= num2; i += 1) {
        console.log(i);
      }
    }
  };
}

var countlog = makeCounterLogger(5);

countlog(8);
countlog(2);

// 2

function makeList() {
  var list = [];
  return function (item) {
    if (item === undefined) {
      if (list.length === 0) console.log('The list is empty.');
      list.forEach(item => console.log(item));
    } else if (list.includes(item)) {
      list.splice(list.indexOf(item), 1);
      console.log(`${item} removed!`)
    } else {
      list.push(item);
      console.log(`${item} added!`);
    }
  }
}

var list = makeList();
list();
list('make breakfast');
list('read book');
list();
list('make breakfast');
list();

// 1

function makeMultipleLister(num) {
  var total = num;
  return function () {
    while (total < 100) {
      console.log(total);
      total += num;
    }
  };
}

var lister = makeMultipleLister(13);
lister();

// 2

var total = 0;

function add(num) {
  total += num;
  console.log(num);
}

function subtract(num) {
  total -= num;
  console.log(num);
}

// 3

function later(func, arg) {
  return function () {
    func(arg);
  }
}

var logWarning = later(console.log, 'The system is shutting down!');
logWarning();

// 4

function startup() {
  var status = 'ready';
  return function() {
    console.log('The system is ready.');
  };
}

var ready = startup();
var systemStatus = // ? 

// can't be done. status on line 91 is private

