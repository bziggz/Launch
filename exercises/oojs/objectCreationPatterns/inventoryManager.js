const ItemManager = (function () {
  const makeSKU = (name, category) => {
    const prefix = name.replace(' ', '').slice(0, 3).toUpperCase();
    const suffix = category.slice(0, 2).toUpperCase();

    return `${prefix}${suffix}`;
  };

  const invalidItemName = (itemName) => (itemName.replace(' ', '').length < 5);
  const invalidCategory = (category) => (category.length < 5 || / /.test(category));

  return {
    items: [],

    create(name, category, quantity) {
      if (invalidItemName(name) || invalidCategory(category)
        || quantity === undefined) return { notValid: true };

      this.items.push({
        SKU: makeSKU(name, category),
        name,
        category,
        quantity,
      });

      return this;
    },

    update(sku, obj) {
      for (let i = 0; i < this.items.length; i += 1) {
        if (this.items[i].SKU === sku) {
          Object.keys(obj).forEach((property) => this.items[i][property] = obj[property]);
        }
      }
    },

    delete(sku) {
      this.items = this.items.filter((item) => item.SKU !== sku);
    },


    inStock() {
      const result = [];

      for (let i = 0; i < this.items.length; i += 1) {
        if (this.items[i].quantity > 0) result.push(this.items[i]);
      }

      return result;
    },

    itemsInCategory(search) {
      const result = [];

      for (let i = 0; i < this.items.length; i += 1) {
        if (this.items[i].category === search) result.push(this.items[i]);
      }

      return result;
    },

  };
}());

const ReportManager = (function () {
  return {
    init(itemObject) {
      this.items = itemObject;
    },

    createReporter(sku) {
      for (let i = 0; i < this.items.items.length; i += 1) {
        if (this.items.items[i].SKU === sku) {
          const item = this.items.items[i];
          return {
            item,

            itemInfo() {
              const itemPropertyList = Object.keys(this.item);

              for (let j = 0; j < itemPropertyList.length; j += 1) {
                const property = itemPropertyList[j];

                console.log(`${property}: ${this.item[property]}`);
              }
            },
          };
        }
      }

      return 'Invalid SKU.';
    },

    reportInStock() {
      const result = [];

      for (let i = 0; i < this.items.items.length; i += 1) {
        if (this.items.items[i].quantity > 0) result.push(this.items.items[i].name);
      }

      console.log(result.join(','));
    },
  };
}());


ItemManager.create('basket ball', 'sports', 0);          // valid item
ItemManager.create('asd', 'sports', 0);
ItemManager.create('soccer ball', 'sports', 5);           // valid item
ItemManager.create('football', 'sports');
ItemManager.create('football', 'sports', 3);              // valid item
ItemManager.create('kitchen pot', 'cooking items', 0);
ItemManager.create('kitchen pot', 'cooking', 3);          // valid item

console.log(ItemManager.items);       
// returns list with the 4 valid items

ReportManager.init(ItemManager);

ReportManager.reportInStock();
// logs soccer ball,football,kitchen pot

ItemManager.update('SOCSP', { quantity: 0 });
console.log(ItemManager.inStock());
// returns list with the item objects for football and kitchen pot
ReportManager.reportInStock();
// logs football,kitchen pot
console.log(ItemManager.itemsInCategory('sports'));
// returns list with the item objects for basket ball, soccer ball, and football
ItemManager.delete('SOCSP');
console.log(ItemManager.items);
// returns list with the remaining 3 valid items (soccer ball is removed from the list)

var kitchenPotReporter = ReportManager.createReporter('KITCO');
kitchenPotReporter.itemInfo();
// logs
// skuCode: KITCO
// itemName: kitchen pot
// category: cooking
// quantity: 3

ItemManager.update('KITCO', { quantity: 10 });
kitchenPotReporter.itemInfo();
// logs
// skuCode: KITCO
// itemName: kitchen pot
// category: cooking
// quantity: 10