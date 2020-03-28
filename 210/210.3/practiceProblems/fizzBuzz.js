const fizzBuzz = function fizzBuzz() {
  for (let i = 1; i <= 100; i += 1) {
    if (i % 3 === 0 && i % 5 === 0) {
      console.log('FizzBuzz');
    } else if (i % 3 === 0) {
      console.log('Fizz');
    } else if (i % 5 === 0) {
      console.log('Buzz');
    } else {
      console.log(i);
    }
  }
};

fizzBuzz();

// FE

function fizzBuzzShort() {
  let message;
  let i;

  for (i = 1; i <= 100; i += 1) {
    message = '';

    if (i % 3 === 0) message += 'Fizz';

    if (i % 5 === 0) message += 'Buzz';

    console.log(message || i);
  }
}

fizzBuzzShort();
