const Account = (function iife() {
  const accounts = {};

  const makeDisplayName = () => {
    const key = 'abcdefghijklmnopqrstuvwxyz0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    let result = '';

    for (let i = 0; i < 16; i += 1) {
      result += key[Math.floor(Math.random() * key.length)];
    }

    return result;
  };

  return {
    init(email, password, firstName, lastName) {
      this.displayName = makeDisplayName();

      accounts[this.displayName] = {
        email,
        password,
        firstName,
        lastName,
      };

      return this;
    },

    reanonymize(passwordAttempt) {
      if (passwordAttempt === accounts[this.displayName].password) {
        this.displayName = makeDisplayName();
        return true;
      }

      return 'Invalid Password';
    },

    resetPassword(oldPassword, newPassword) {
      if (oldPassword === accounts[this.displayName].password) {
        accounts[this.displayName].password = newPassword;
        return true;
      }

      return 'Invalid Password';
    },

    firstName(passwordAttempt) {
      if (passwordAttempt === accounts[this.displayName].password) {
        return accounts[this.displayName].firstName;
      }

      return 'Invalid Password';
    },

    lastName(passwordAttempt) {
      if (passwordAttempt === accounts[this.displayName].password) {
        return accounts[this.displayName].lastName;
      }

      return 'Invalid Password';
    },

    email(passwordAttempt) {
      if (passwordAttempt === accounts[this.displayName].password) {
        return accounts[this.displayName].email;
      }

      return 'Invalid Password';
    },

    displayName() {
      return this.displayName;
    },
  };
}());

var fooBar = Object.create(Account).init('foo@bar.com', '123456', 'foo', 'bar');
console.log(fooBar.firstName);                     // returns the firstName function
console.log(fooBar.email);                         // returns the email function
console.log(fooBar.firstName('123456'));           // logs 'foo'
console.log(fooBar.firstName('abc'));              // logs 'Invalid Password'
console.log(fooBar.displayName);                   // logs 16 character sequence
console.log(fooBar.resetPassword('123', 'abc'))    // logs 'Invalid Password';
console.log(fooBar.resetPassword('123456', 'abc')) // logs true

var displayName = fooBar.displayName;
fooBar.reanonymize('abc');                         // returns true
console.log(displayName === fooBar.displayName);   // logs false
