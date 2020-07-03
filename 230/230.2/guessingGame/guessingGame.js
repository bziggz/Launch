document.addEventListener('DOMContentLoaded', () => {
  let answer = Math.floor(Math.random() * 100) + 1;
  let input = document.querySelector('#guess');

  document.querySelector('form').addEventListener('click', (event) => {
    event.preventDefault();
    let guess = parseInt(input.value, 10);
    let message;
    if (isNaN(guess) || guess < 1 || guess > 100) {
      message = 'Please enter a number 1 to 100.'
    } else if (guess > answer) {
      message = `The answer is lower than ${guess}`;
    } else if (guess < answer) {
      message = `The answer is higher than ${guess}`;
    } else {
      message = `Correct! The answer is ${guess}`;
      document.querySelector('[type="submit"]').disabled = true;
    }

    document.querySelector('p').textContent = message;
  });

  document.querySelector('a').addEventListener('click', (event) => {
    answer = Math.floor(Math.random() * 100) + 1;
    message = `Please enter a number 1 to 100.`
    document.querySelector('p').textContent = message;
  });
});