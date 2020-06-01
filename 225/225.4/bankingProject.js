// const account = {
//   balance: 0,
//   transactions: [],

//   deposit(amount) {
//     this.balance += amount;
//     this.transactions.push({ type: 'deposit', amount });
//     return this.balance;
//   },

//   withdraw(amount) {
//     const withdrawal = amount > this.balance ? this.balance : amount;

//     this.transactions.push({ type: 'withdrawal', amount: withdrawal });
//     this.balance -= withdrawal;

//     return withdrawal;
//   },
// };

const makeBank = () => {
  const accounts = [];

  const makeAccount = (number) => {
    let balance = 0;
    const transactions = [];

    return {
      deposit(amount) {
        balance += amount;
        transactions.push({ type: 'deposit', amount });
        return balance;
      },

      withdraw(amount) {
        const withdrawal = amount > balance ? balance : amount;

        transactions.push({ type: 'withdrawal', amount: withdrawal });
        balance -= withdrawal;

        return withdrawal;
      },

      balance() {
        return balance;
      },

      number() {
        return number;
      },

      transactions() {
        return transactions;
      },
    };
  };

  return {
    openAccount() {
      const newAccount = makeAccount(accounts.length + 101);

      accounts.push(newAccount);

      return newAccount;
    },

    transfer(sourceAcct, destinationAcct, amount) {
      const transferAmount = sourceAcct.withdraw(amount);

      destinationAcct.deposit(transferAmount);
    },

    accounts() {
      return accounts;
    },
  };
};

const bank = makeBank();
const source = bank.openAccount();
source.deposit(10);
const destination = bank.openAccount();
bank.transfer(source, destination, 7);
console.log(bank.accounts);
console.log(bank.accounts());
