// function invoiceTotal(amount1, amount2, amount3, amount4) {
//   return amount1 + amount2 + amount3 + amount4;
// }

function invoiceTotal(...args) {
  args.reduce((acc, el) => acc + el, 0);
}


console.log(invoiceTotal(20, 30, 40, 50)); // works as expected
console.log(invoiceTotal(20, 30, 40, 50, 40, 40)); // does not work; how can you make it work?
