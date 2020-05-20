// 1

const scissors = {
  id: 0,
  name: 'Scissors',
  stock: 8,
  price: 10,
};

const drill = {
  id: 1,
  name: 'Cordless Drill',
  stock: 15,
  price: 45,
};

// 2

const setPrice = (item, newPrice) => {
  if (newPrice <= 0) return 'Price must be greater than $0';

  item.price = newPrice;
};

// 3

const describeProduct = (item) => {
  console.log('Name: ' + item.name);
  console.log('ID: ' + item.id);
  console.log('Price: $' + item.price);
  console.log('Stock: ' + item.stock);
};

describeProduct(scissors);

const makeProduct = (id, name, stock, price) => (
  {
    id,
    name,
    stock,
    price,

    setPrice(newPrice) {
      if (newPrice <= 0) return 'Price must be greater than $0';

      this.price = newPrice;
    },

    describe() {
      console.log('Name: ' + this.name);
      console.log('ID: ' + this.id);
      console.log('Price: $' + this.price);
      console.log('Stock: ' + this.stock);
    },
  }
);

const hammer = makeProduct(2, 'Hammer', 14, 15);
const paintBrush = makeProduct(3, 'Paint Brush', 4, 10);

hammer.describe();
