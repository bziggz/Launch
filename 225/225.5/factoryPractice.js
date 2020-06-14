// 1

// Factory functions make identifying objects/properties difficult.
// Duplicate properties and behaviors are created with each new function.
// It's difficult to tell if a factory function has been used.

// 2

// function makeObj() {
//   var obj = {};
//   obj.propA = 10;
//   obj.propB = 20;
//   return obj;
// }

function makeObj() {
  return {
    propA: 10,
    propB: 20,
  };
}

// 3

function createInvoice(services) {
  services = services || {};
  const payments = []; // 5

  return {
    phone: services.phone || 3000,
    internet: services.internet || 5500,
    payments: [],
    total() {
      return this.phone + this.internet;
    },

    // 5

    addPayment(servicePayment) {
      this.payments.push(servicePayment);

      return this.payments;
    },

    addPayments(servicePayments) {
      this.payments = this.payments.concat(servicePayments);

      return this.payments;
    },

    amountDue() {
      return this.total()
        - this.payments.reduce((sum, payment) => sum + payment.total(), 0);
    },
  };
}

function invoiceTotal(invoices) {
  var total = 0;
  var i;

  for (i = 0; i < invoices.length; i += 1) {
    total += invoices[i].total();
  }

  return total;
}

// var invoices = [];
// invoices.push(createInvoice());

// invoices.push(createInvoice({
//   internet: 6500,
// }));

// invoices.push(createInvoice({
//   phone: 2000,
// }));

// invoices.push(createInvoice({
//   phone: 1000,
//   internet: 4500,
// }));

// console.log(invoiceTotal(invoices));             // => 31000

// 4

function createPayment(services) {
  services = services || {};

  return {
    phone: services.phone || 0,
    internet: services.internet || 0,
    amount: services.amount || null,

    total() {
      return this.amount === null ? this.phone + this.internet : this.amount;
    },
  };
}

function paymentTotal(payments) {
  var total = 0;
  var i;

  for (i = 0; i < payments.length; i += 1) {
    total += payments[i].total();
  }

  return total;
}

// var payments = [];
// payments.push(createPayment());
// payments.push(createPayment({
//   internet: 6500,
// }));

// payments.push(createPayment({
//   phone: 2000,
// }));

// payments.push(createPayment({
//   phone: 1000,
//   internet: 4500,
// }));

// payments.push(createPayment({
//   amount: 10000,
// }));

// console.log(paymentTotal(payments));      // => 24000

// 5

var invoice = createInvoice({
  phone: 1200,
  internet: 4000,
});

var payment1 = createPayment({
  amount: 2000,
});

var payment2 = createPayment({
  phone: 1000,
  internet: 1200,
});

var payment3 = createPayment({
  phone: 1000,
});

console.log(invoice)
console.log(invoice.total());
invoice.addPayment(payment1);
invoice.addPayments([payment2, payment3]);
console.log(invoice.amountDue());       // this should return 0

