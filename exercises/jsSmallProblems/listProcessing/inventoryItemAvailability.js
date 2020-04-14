const transactions = [ { id: 101, movement: 'in',  quantity:  5 },
                     { id: 105, movement: 'in',  quantity: 10 },
                     { id: 102, movement: 'out', quantity: 17 },
                     { id: 101, movement: 'in',  quantity: 12 },
                     { id: 103, movement: 'out', quantity: 15 },
                     { id: 102, movement: 'out', quantity: 15 },
                     { id: 105, movement: 'in',  quantity: 25 },
                     { id: 101, movement: 'out', quantity: 18 },
                     { id: 102, movement: 'in',  quantity: 22 },
                     { id: 103, movement: 'out', quantity: 15 }, ];

const transactionsFor = (itemID, transactionList) => (
  transactionList.filter((item) => item.id === itemID)
);

const isItemAvailable = (itemID, transactionList) => {
  const itemLog = transactionsFor(itemID, transactionList);
  let quantityInStock = 0;

  itemLog.forEach((transaction) => {
    quantityInStock += transaction.movement === 'in'
      ? transaction.quantity : -transaction.quantity;
  });

  return quantityInStock > 0;
};

console.log(isItemAvailable(101, transactions)); // false
console.log(isItemAvailable(105, transactions)); // true
