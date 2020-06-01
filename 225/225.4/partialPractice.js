// 1

function greet(greeting, name) {
  let result = '';

  for (let i = 0; i < greeting.length: i += 1) {
    if (i === 0) {
      result += greeting[i].toUpperCase();
    } else {
      result += greeting[i];
    }
  }

  console.log(`${result}, ${name}!`);
}

// 2

function partial(primary, arg1) {
  return function(arg2) {
    return primary(arg1, arg2);
  };
}

const sayHello = partial(greet, `hello`);
const sayHi = partial(greet, 'hi');

// 1

function subtract(a, b) {
  return a - b;
}

function sub5(a) {
  return subtract(a, 5);
}

sub5(10); // 5
sub5(20); // 15

// 2

function subtract(a, b) {
  return a - b;
}

function makeSubN(n) {
  return function (a) {
    return subtract(a, n);
  };
}

var sub5 = makeSubN(5);
sub5(10); // 5

// 3

function makePartialFunc(func, b) {
  return function(a) {
    return func(a, b);
  };
}

function multiply(a, b) {
  return a * b;
}

var multiplyBy5 = makePartialFunc(multiply, 5);

multiplyBy5(100); // 500

// 4

// the closure created during the assignment gives multiplyBy5 access to func\

// 5

var subjects = {
  English: ['Bob', 'Tyrone', 'Lizzy'],
  Math: ['Fatima', 'Gary', 'Susan'],
  Biology: ['Jack', 'Sarah', 'Tanya'],
};

function rollCall(subject, students) {
  console.log(subject + ':');
  students.forEach(function(student) {
    console.log(student);
  });
}

function makeMathRollCall() {
  return function(students) {
    return rollCall('Math', students);
  }
}

var mathRollCall = makeMathRollCall();
mathRollCall(subjects['Math']);
// => Math:
// => Fatima
// => Gary
// => Susan
