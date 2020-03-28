const password = 'password';
const rlSync = require('readline-sync');

const login = function getPassword() {
  for (let i = 3; i > 0; i -= 1) {
    const answer = rlSync.question('What is the password: ');

    if (answer === password) {
      console.log('You have successfully logged in.');
      return;
    }
  }

  console.log('You have been denied acces.');
};

login();
