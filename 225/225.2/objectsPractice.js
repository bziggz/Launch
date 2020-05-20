const invoices = { // 1
  unpaid: [],

  paid: [],

  add: function (clientName, amountOwed) {     // 2
    this.unpaid.push({ name: clientName, amount: amountOwed });
  },

  totalDue: function() {    // 3
    return this.unpaid.reduce((total, transaction) => total + transaction.amount, 0);
  },

  payInvoice: function (clientName) {     // 5
    const result = [];

    for (let i = 0; i < this.unpaid.length; i += 1) {
      if (this.unpaid[i].name === clientName) {
        this.paid.push(this.unpaid[i]);
      } else {
        result.push(this.unpaid[i]);
      }
    }

    this.unpaid = result;
  },

  totalPaid: function() {     // 6
    return this.paid.reduce((total, transaction) => total + transaction.amount, 0);
  }
};

// 4

invoices.add('Due North Development', 250);
invoices.add('Moonbeam Interactive', 187.50);
invoices.add('Slough Digital', 300);

console.log(invoices.totalDue());

// 7

invoices.payInvoice('Due North Development');
invoices.payInvoice('Slough Digital');

console.log([invoices.totalPaid(), invoices.totalDue()]);
