function makeList() {
  const items = [];

  return {
    add(item) {
      items.push(item);
      console.log(`${item} added!`);
    },

    remove(item) {
      const idx = items.indexOf(item);
      items.splice(idx, 1);
      console.log(`${item} removed!`);

    },

    list() {
      if (items.length === 0) console.log('The list is empty.')
      items.forEach(item => console.log(item));
    }
  }
}